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

  
  // 상단 주소 바 생성
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
  
  // 뒤로 가기 버튼 생성
  back_button := ui.button(ui.ButtonParams{
    text: '뒤로'
    on_click: fn [mut app] (btn &ui.Button) {
      parent := os.dir(app.path)
      if parent != app.path {
        app.change_directory(parent)
      }
    }
  })
  
  // 새로고침 버튼 생성
  refresh_button := ui.button(ui.ButtonParams{
    text: '새로고침'
    on_click: fn [mut app] (btn &ui.Button) {
      app.refresh_files()
    }
  })
  
  // 상단 레이아웃 구성
  top_layout := ui.row(ui.RowParams{
    spacing: 5
    margin: ui.Margin{5, 5, 5, 5}
    children: [
      back_button, refresh_button, app.address
    ]
  })
  
  // 파일 목록 생성 (초기에는 빈 목록으로)
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
  
  // 상태 표시줄 생성
  app.status = ui.label(ui.LabelParams{
    text: '준비됨'
  })
  
  // 메인 레이아웃 구성
  app.main_layout = ui.column(ui.ColumnParams{
    spacing: 5
    margin: ui.Margin{5, 5, 5, 5}
    children: [
      top_layout, app.list, app.status
    ]
  })
  app.window.root_layout = app.main_layout  // root_layout 대신 set_content 사용
  app.refresh_files()
  ui.run(app.window)
}

// 디렉토리 변경 함수
fn (mut app App) change_directory(path string) {
  app.path = path
  app.address.set_text(path)
  app.refresh_files()
}

// 파일 목록 새로고침 함수
fn (mut app App) refresh_files() {
  app.get_files()
  app.update_list_items()
  app.status.set_text('${app.files.len}개 항목 표시됨')
}

// 파일 목록 가져오기 함수
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

// 리스트박스 항목 업데이트 함수
fn (mut app App) update_list_items() {
  // 기존 항목 모두 제거
  app.list.items.clear()
  
  // 빈 리스트 처리
  if app.files.len == 0 {
    return
  }
  
  // 항목 맵 생성
  mut items_map := map[string]string{}
  for i, file in app.files {
    items_map[i.str()] = file
  }
  
  // 리스트박스 항목 설정 (맵 사용)
  for id, text in items_map {
    app.list.append_item(id, text, 0)
  }
}

// 운영체제별 파일 실행 함수
fn (app &App) open_file(path string) {
  match os.user_os() {
    'windows' { os.execute('explorer "$path"') }
    'macos' { os.execute('open "$path"') }
    else { os.execute('xdg-open "$path"') }
  }
}