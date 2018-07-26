import { StyleSheet,
         Dimensions } from 'react-native';
import { Metrics, ApplicationStyles } from '../../Themes/';


export default StyleSheet.create({
  ...ApplicationStyles.screen,
  container: {
    paddingBottom: Metrics.baseMargin
  },
  logo: {
    marginTop: Metrics.doubleSection,
    height: Metrics.images.logo,
    width: Metrics.images.logo,
    resizeMode: 'contain'
  },
  centered: {
    alignItems: 'center'
  },
  itemContainer: {
    width: Metrics.productList.imageSize,
    //height: size,
    flex: 1,
    flexDirection: 'column',
    margin: Metrics.smallMargin,
  },
  item: {
    flex: 1,
    margin: Metrics.smallMargin,
  },
  itemTitleBar: {
    flex: 1,
    margin: Metrics.smallMargin,
    flexDirection: 'row',
    justifyContent: 'space-between',
  },
  itemLabel: {
    margin: Metrics.smallMargin,
    fontSize: 20,
    fontWeight: 'bold',
  },
  itemPrice: {
    margin: Metrics.smallMargin,
    fontSize: 20,
  },
  imageStyle: {
    flex: 1,
    resizeMode: 'contain',
    width: Metrics.productList.imageSize,
    height: Metrics.productList.imageSize / Metrics.productList.imageRatio,  // Hard-coded based off of sample Shopify images
  },
});
