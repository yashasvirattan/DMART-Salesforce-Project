import { LightningElement } from 'lwc';
import IMAGES from '@salesforce/resourceUrl/dmart_images';

export default class CarouselMart extends LightningElement {
    image1 = IMAGES + '/dmart_images/dmart1.png';
    image2 = IMAGES + '/dmart_images/dmart2.png';
    image3 = IMAGES + '/dmart_images/dmart3.png';
}