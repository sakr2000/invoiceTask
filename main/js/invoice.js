document.addEventListener("DOMContentLoaded", function () {

    let deleteSelectedBtn = document.getElementById("deleteSelectedRow");
    let itemContainer = document.querySelector("table tbody");

    // calculate the total on input change
    itemContainer.querySelectorAll("tr").forEach((element) => {
        let inputElements = element.querySelectorAll("td input");

        if (inputElements.length == 3) {
            inputElements[1].addEventListener("input", (e) => {
                // only allow positive values
                if (e.target.value >= 0) {
                    calculateTotal()
                } else {
                    e.target.value = ''
                }
            });
            inputElements[2].addEventListener("input", (e) => {
                if (e.target.value >= 0) {
                    calculateTotal()
                } else {
                    e.target.value = ''
                }
            });
        }
    });

    // calculate total for each row
    function calculateTotal() {
        itemContainer.querySelectorAll("tr").forEach((element) => {
            let inputElements = element.querySelectorAll("td input");
            if (inputElements.length == 3) {
                let quantity = inputElements[1].value;
                let price = inputElements[2].value;

                element.querySelector("td span").innerText = (quantity * price).toFixed(2) ;
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
        let deletedRows = [];
        itemContainer.querySelectorAll("tr td input[type='checkbox']").forEach(element => {
            if (element.checked) {
                deletedRows.push(element.parentElement.nextElementSibling.innerText);
                element.parentElement.parentElement.remove();
                getBillTotal();
            }
        });
        document.getElementById('deletedRows').value = deletedRows.join(',');
    });
   
});
