import Analytics from 'react-native-analytics';

// Event names for events sent to Segment from the app - these should be
// fairly self-explanatory - change the strings below to change the event names
// sent to the Segment workspace

const TRACK_PRODUCT_ADDED = 'Product Added';
const TRACK_PRODUCT_REMOVED = 'Product Removed';
const TRACK_PRODUCT_VIEWED = 'Product Viewed';
const TRACK_PRODUCT_CLICKED = 'Product Clicked';

const TRACK_CHECKOUT_STARTED = 'Checkout Started';
const TRACK_CHECKOUT_COMPLETED = 'Checkout Completed';
const TRACK_CART_VIEWED = 'Cart Viewed';
const TRACK_PRODUCT_LIST_VIEWED = 'Product List Viewed';

export function identify(id, name, email) {
  Analytics.track(id, {
    name: name,
    email: email,
  });
}

export function productAdded(variant) {
}

export function productRemoved(variant) {
}

export function checkoutStarted() {
}

export function checkoutCompleted() {
}

export function cartViewed(cart) {
  Analytics.track(TRACK_CART_VIEWED, { products: { ...cart } });
}

export function productViewed(variant) {
  Analytics.track(TRACK_PRODUCT_VIEWED, { ...variant });
}

export function productListViewed(productList) => {
  Analytics.track(TRACK_PRODUCT_LIST_VIEWED, { products: productList } );
}
