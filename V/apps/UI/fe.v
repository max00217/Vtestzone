module main

import ui
import os

struct App {
mut:
  window   &ui.Window = unsafe { nil }
  path     string
  files    []string
  list     &ui.ListBox = unsafe { nil }
  address  &ui.TextBox = unsafe { nil }
  status   &ui.Label = unsafe { nil }
  main_layout &ui.Stack = unsafe { nil }
}

fn main() {
  mut app := &App{
    path: os.home_dir()
  }
  
  app.window = ui.window(ui.WindowParams{
    width: 800
    height: 600
    title: '간단한 파일 탐색기'
    on_click: fn (window &ui.Window, event ui.MouseEvent) {
      exit(0)
    }
  })

  
  // Create top address bar
  app.address = ui.textbox(ui.TextBoxParams{
    width: 600
    text: &app.path
    on_enter: fn [mut app] (textbox &ui.TextBox) {
      new_path := textbox.text
      if os.is_dir(new_path) {
        app.change_directory(new_path)
      } else {
        app.status.set_text('유효하지 않은 디렉토리입니다.')
      }
    }
  })
  
  // Create back button
  back_button := ui.button(ui.ButtonParams{
    text: '뒤로'
    on_click: fn [mut app] (btn &ui.Button) {
      parent := os.dir(app.path)
      if parent != app.path {
        app.change_directory(parent)
      }
    }
  })
  
  // Create refresh button
  refresh_button := ui.button(ui.ButtonParams{
    text: '새로고침'
    on_click: fn [mut app] (btn &ui.Button) {
      app.refresh_files()
    }
  })
  
  // Configure top layout
  top_layout := ui.row(ui.RowParams{
    spacing: 5
    margin: ui.Margin{5, 5, 5, 5}
    children: [
      back_button, refresh_button, app.address
    ]
  })
  
  // Create file list (initially empty)
  app.list = ui.listbox(ui.ListBoxParams{
    width: 780
    height: 500
    scrollview: true
    text_size: 14.0
    theme: 'default'
    items: map[string]string{}
    on_change: fn [mut app] (lb &ui.ListBox) {
      if lb.selection >= 0 && lb.selection < app.files.len {
        selected := app.files[lb.selection]
        selected_path := os.join_path(app.path, selected)
        app.status.set_text(selected_path)

        if os.is_dir(selected_path) {
          app.change_directory(selected_path)
        } else {
          app.open_file(selected_path)
        }
      }
    }
  })
  
  // Create status bar
  app.status = ui.label(ui.LabelParams{
    text: '준비됨'
  })
  
  // Configure main layout
  app.main_layout = ui.column(ui.ColumnParams{
    spacing: 5
    margin: ui.Margin{5, 5, 5, 5}
    children: [
      top_layout, app.list, app.status
    ]
  })
  app.window.root_layout = app.main_layout  // Use set_content instead of root_layout
  app.refresh_files()
  ui.run(app.window)
}

// Function to change directory
fn (mut app App) change_directory(path string) {
  app.path = path
  app.address.set_text(path)
  app.refresh_files()
}

// Function to refresh file list
fn (mut app App) refresh_files() {
  app.get_files()
  app.update_list_items()
  app.status.set_text('${app.files.len}개 항목 표시됨')
}

// Function to get file list
fn (mut app App) get_files() {
  app.files.clear()
  items := os.ls(app.path) or {
    app.status.set_text('디렉토리를 읽을 수 없습니다: $err')
    return
  }

  mut dirs := []string{}
  mut files := []string{}
  
  for item in items {
    if item.starts_with('.') {
      continue
    }
    full_path := os.join_path(app.path, item)
    if os.is_dir(full_path) {
      dirs << item + '/' 
    } else {
      files << item
    }
  }
  
  dirs.sort()
  files.sort()
  app.files = dirs
  app.files << files
}

// Function to update listbox items
fn (mut app App) update_list_items() {
  // Remove all existing items
  app.list.items.clear()
  
  // Handle empty list
  if app.files.len == 0 {
    return
  }
  
  // Create item map
  mut items_map := map[string]string{}
  for i, file in app.files {
    items_map[i.str()] = file
  }
  
  // Set listbox items (using map)
  for id, text in items_map {
    app.list.append_item(id, text, 0)
  }
}

// Function to open file based on OS
fn (app &App) open_file(path string) {
  match os.user_os() {
    'windows' { os.execute('explorer "$path"') }
    'macos' { os.execute('open "$path"') }
    else { os.execute('xdg-open "$path"') }
  }
}