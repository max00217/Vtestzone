// 파일: file_explorer.v
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
  
  // 파일 목록 생성
  app.list = ui.listbox(ui.ListBoxParams{
    width: 780
    height: 500
    scrollview: true  // ScrollView 활성화
    text_size: 14.0   // 텍스트 크기 명시적 설정
    theme: 'default'  // 테마 명시적 설정
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
  main_layout := ui.column(ui.ColumnParams{
    spacing: 5
    margin: ui.Margin{5, 5, 5, 5}
    children: [
      top_layout, app.list, app.status
    ]
  })
  
  // 메인 윈도우에 레이아웃 추가
  app.window.root_layout = main_layout
  
  // 초기 파일 목록 표시
  app.refresh_files()
  
  // GUI 실행
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
  
  // 안전하게 리스트 초기화
  app.list.items.clear()  // 기존 항목 모두 제거
  
  // 빈 리스트로 초기화
  if app.files.len == 0 {
    app.status.set_text('항목이 없습니다')
    return
  }
  
  // 각 파일에 대해 append_item 메소드 사용
  // 더 안전한 방법으로 항목 추가
  for i, file in app.files {
    // 문자열 ID 생성
    id := i.str()
    // 안전하게 항목 추가
    app.list.append_item(id, file, 0)
  }
  
  app.status.set_text('${app.files.len}개 항목 표시됨')
}

// 운영체제별 파일 실행 함수
fn (app &App) open_file(path string) {
  match os.user_os() {
    'windows' { os.execute('explorer "$path"') }
    'macos' { os.execute('open "$path"') }
    else { os.execute('xdg-open "$path"') }
  }
}