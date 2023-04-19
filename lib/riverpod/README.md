# 案内

ファイルを探すための目次です

# **第 1 回** パッケージの選び方

- pubspec_yaml.txt
  - 必要なパッケージを準備
  - 実際には `pubspec.yaml` に書いてください
- my_widget.dart
  - 次回のために `ConsumerWidget` を 1 つ準備
- main.dart
  - アプリを `ProviderScope` で囲むところがポイント

# **第 2 回** 状態の準備

- s1.dart
  - 単純データ `int`
- s2.dart
  - 複雑データ `List`
- s3.dart
  - Future 系 `Future`
- s4.dart
  - Stream `Stream`

# **第 3 回** 状態の使い方

- my_widget_1.dart
  - 状態を `watch`
  - 状態を `listen`
  - ノティファイアを `read`
- my_widget_2.dart
  - 状態を watch
  - ノティファイアを read
- my_widget_3.dart
  - 状態を watch
  - `AsyncValue` で 3 つに分岐
  - ノティファイアを read
- my_widget_4.dart
  - 状態を watch
  - AsyncValue で 3 つに分岐
  - ノティファイアを read

# **第 4 回** 応用編

応用編は説明の章ごとにフォルダを分けてあります

## select

- select/
  - sikoku.dart
  - main.dart
  - state.dart
  - widget.dart

## build & onDispose

- build_ondispose/
  - main.dart

## keepAlive

- /keep_alive
  - state.dart
  - main.dart

## BasicProvider

- /basic_provider
  - main.dart
  - basic.dart

## BasicProvider - プロキシ

- /basic_provider_proxy
  - main.dart
  - proxy.dart

## BasicProvider - ロジック

- /basic_provider_logic
  - main.dart
  - logic.dart

## BasicProvider - キャッシュ

- /basic_provider_cache
  - main.dart
  - cache.dart

## ProviderFamily

- /provider_family
  - main.dart
  - family.dart

## ProviderScope

- /provider_scope
  - main.dart

## overrideWith

- /override_with
  - state.dart
  - main.dart

# 説明用アイコン

ダウンロードはこちらからどうぞ

| 名前.png                   | 画像 |
| -------------------------- | ---- |
| pkg-yellow                 | img  |
| pkg-blue                   | img  |
| widget-stless              | img  |
| widget-stful               | img  |
| widget-consumer            | img  |
| widget-consumer-stful      | img  |
| widget-hook-consumer       | img  |
| widget-stful-hook-consumer | img  |
| state                      | img  |
| state-and-provider         | img  |
| provider                   | img  |
| notifier                   | img  |
| notifier-dollar            | img  |
| gen                        | img  |
| ref                        |
| ref-watch                  | img  |
| ref-listen                 | img  |
| ref-read                   | img  |
| async-value                | img  |
| async-value-loading        | img  |
| async-value-error          | img  |
| async-value-data           | img  |
| state-select               | img  |
| provider-keep-alive        | img  |
| provider-basic             | img  |
| provider-proxy             | img  |
| provider-logic             | img  |
| provider-cache             | img  |
| provider-family            | img  |
| provider-scope             | img  |
| override-with              | img  |
