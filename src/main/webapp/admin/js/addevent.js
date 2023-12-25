function validateForm() {
    var ename = document.getElementById("ename").value;
    var ecategory = document.getElementById("ecategory").value;
    var eprice = document.getElementById("eprice").value;

    if (ename.trim() === '' || ecategory.trim() === '' || eprice.trim() === '') {
        alert("Event Name, Event Category/Type, and Estimate Price are required fields.");
        return false;
    }

    return true;
}
