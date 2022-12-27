window.addEventListener("DOMContentLoaded", () => {

  // プレビュー表示に関する処理
  const buildPreview = (blob, dataIndex) => {
    const previewImage = document.createElement("img");
    previewImage.setAttribute("src", blob);
    previewImage.setAttribute("class", "preview-img");
    previewImage.setAttribute("data-index", dataIndex);
    // 削除ボタンの生成
    const deleteButton = document.createElement("div");
    deleteButton.setAttribute("class", "delete-button");
    deleteButton.setAttribute("data-index", dataIndex);
    deleteButton.innerText = "削除";

    // 削除ボタンをクリックしたら、プレビューとfile_filedを削除
    deleteButton.addEventListener("click", () => deletePreview(dataIndex));
    
    // プレビュー画像一覧表示
    const previewBox = document.getElementById("preview-box");
    previewBox.appendChild(previewImage);
    // 削除ボタンをappend
    previewBox.appendChild(deleteButton);
  }

  // file_filedに関する処理
  const buildFileField = () => {
    const newFileField = document.createElement("input");
    newFileField.setAttribute("type", "file");
    // file_fieldにdata-indexを設定
    const lastFileField = document.querySelector('input[type="file"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute("data-index")) + 1;
    newFileField.setAttribute("data-index", nextDataIndex);
    // 2枚目以降のプレビュー表示
    newFileField.addEventListener("change", changeFileField);
    // file_filedを表示するdivタグを取得、append
    const fileFields = document.querySelector(".file-upload");
    fileFields.appendChild(newFileField);
  }

  // すでに選択済みのfile_filedを再度選択し、何も画像を選択しなかった場合の処理
  const deletePreview = (dataIndex) => {
    // プレビュー画像削除
    const previewImage = document.querySelector(`.preview-img[data-index="${dataIndex}"]`);
    previewImage.remove();
    // file_filed削除
    const fileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    fileField.remove();
    // 削除ボタン削除
    const deleteButton = document.querySelector(`.delete-button[data-index="${dataIndex}"]`);
    deleteButton.remove();
  }

  // イベントが発火したときの処理
  const changeFileField = (e) => {
    // 何番目のfile_fieldを操作しているか確認
    const dataIndex = e.target.getAttribute("data-index");
    const file = e.target.files[0];
    // fileが空の場合(何も選択されなかった場合)、プレビュー等を削除する
    if (!file) {
      deletePreview(dataIndex);
      return null;
    }
    const blob = window.URL.createObjectURL(file);
    // data-indexを使ってプレビューが表示されているか確認
    const oldPreview = document.querySelector(`.preview-img[data-index="${dataIndex}"]`)
    if (oldPreview) {
      // すでにプレビュー画像が表示されている場合の処理
      oldPreview.setAttribute("src", blob);
      return null;
    }
    buildPreview(blob, dataIndex);
    // file_filedに関する処理呼び出し
    buildFileField();
  }

  // file_filedの取得
  const preview = document.getElementById("preview");

  // イベント発火、changeFileField呼び出し
  preview.addEventListener("change", changeFileField);
});