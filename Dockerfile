FROM python:3.13

# 作業ディレクトリ
WORKDIR /code

# 依存関係ファイルをコピー
COPY requirements.txt /code/
RUN pip install -r requirements.txt
# Node.js と npm をインストール（Tailwind 用）

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs 
# Tailwind CSS をインストール

RUN npm install -D tailwindcss postcss autoprefixer
 
# Tailwind 初期化（必要に応じて）

RUN npx tailwindcss init -p


# 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトをコピー
COPY /app/ /code/