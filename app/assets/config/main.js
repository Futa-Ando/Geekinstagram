const display = document.getElementById("display")
const plusButton = document.getElementById("plus-button")

// ボタンをクリックしたときの処理を登録
plusButton.onclick = function(){
    plusButton.onclick = function(){
        // count を更新
        count += 1
        // count を表示
        display.textContent = count
}
