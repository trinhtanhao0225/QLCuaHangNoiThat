/**
 * 
 */
let cartCount = 0;

function showDetails() {
    const details = document.getElementById('details');
    if (details.style.display === 'block') {
        details.style.display = 'none';
    } else {
        details.style.display = 'block';
    }
}

function addToCart() {
    cartCount++;
    document.getElementById('cart-count').textContent = cartCount;
    alert('Sản phẩm đã được thêm vào giỏ hàng!');
}
