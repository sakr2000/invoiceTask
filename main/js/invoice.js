let deleteSelectedBtn = document.getElementById("deleteSelectedRow");
let itemContainer = document.getElementById("itemContainer");



// calculate the total on input change
itemContainer.querySelectorAll("tr").forEach((element) => {
    if (element.querySelectorAll("td input").length == 3) {
        element.querySelectorAll("td input")[1].addEventListener("input", (e) => {
            // only allow positive values
            if (e.target.value >= 0) {
                calculateTotal()
            } else {
                e.target.value = ''
            }
        });
        element.querySelectorAll("td input")[2].addEventListener("input", (e) => {
            if (e.target.value >= 0) {
                calculateTotal()
            } else {
                e.target.value = ''
            }
        });
    }
});

function calculateTotal() {
    itemContainer.querySelectorAll("tr").forEach((element) => {
        if (element.querySelectorAll("td input").length == 3) {
            let quantity = element.querySelectorAll("td input")[1].value;
            let price = element.querySelectorAll("td input")[2].value;

            element.querySelector("td span").innerText = quantity * price == 'NaN' ? "0.00" : (quantity * price).toFixed(2) ;
            
        }

    });
    getBillTotal();
}
calculateTotal();

// Get net value of pill
function getBillTotal() {
    let total = 0;
    itemContainer.querySelectorAll(".text-primary span").forEach((element) => {
        total = total + parseFloat(element.innerText);
    });

    document.getElementById("netValue").innerText = total.toFixed(2);
}


// Delete checked rows from html
deleteSelectedBtn.addEventListener("click", (e) => {
    e.preventDefault();
itemContainer.querySelectorAll("tr td input[type='checkbox']").forEach(element => {
    if (element.checked) {
        element.parentElement.parentElement.remove();
        getBillTotal();
    }
});
    
});