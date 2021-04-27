window.addEventListener('load', function(){
  //金額を入力した数値をpriceInputという変数に格納する
  const sellingPrice = document.getElementById("item-price")
  //console.log(sellingPrice)
  sellingPrice.addEventListener("input", function(){
    const inputPrice = sellingPrice.value;
    
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(inputPrice * 0.1);

    const salesProfit = document.getElementById("profit");
    const value_result = inputPrice * 0.1
    salesProfit.innerHTML = Math.floor(inputPrice-value_result);
  })
})

