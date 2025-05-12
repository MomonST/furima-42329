const price = () => {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      // 販売手数料や利益に対応(正規表現で半角数字のみ対象)
      if (/^\d+$/.test(inputValue)) {
        const tax = Math.floor(inputValue * 0.1);
        const profit = Math.floor(inputValue - tax);

        addTaxDom.innerHTML = tax;
        profitDom.innerHTML = profit;
      } else {
        // 不正な入力時は空白にして表示をクリア
        addTaxDom.innerHTML = "";
        profitDom.innerHTML = "";
      }
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);