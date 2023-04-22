import 'package:e_kart/models/product.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

var mobileProducts = [
  ProductModel(
      pId: uuid.v4(),
      pName: 'realme C33',
      pImage:
          'https://rukminim1.flixcart.com/image/312/312/xif0q/mobile/9/z/o/-original-imaghuf9guqmb65z.jpeg?q=70',
      pAmout: 9999),
  ProductModel(
      pId: uuid.v4(),
      pName: 'POCO X5 5G',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/mobile/f/e/l/-original-imagnqpndcmxghyq.jpeg?q=70',
      pAmout: 16999),
  ProductModel(
      pId: uuid.v4(),
      pName: 'Google Pixel 6a',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/mobile/s/y/0/-original-imaggbrbxkqr3v3u.jpeg?q=70',
      pAmout: 28999),
  ProductModel(
      pId: uuid.v4(),
      pName: 'vivo Y21T',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/mobile/1/j/b/-original-imagjdmz7fxz9ht8.jpeg?q=70',
      pAmout: 15499),
  ProductModel(
      pId: uuid.v4(),
      pName: 'Nothing Phone (1)',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/l5h2xe80/mobile/5/x/r/-original-imagg4xza5rehdqv.jpeg?q=70',
      pAmout: 28999),
];

var laptopProducts = [
  ProductModel(
      pId: uuid.v4(),
      pName: 'HP Victus Intel Core i5 11th Gen',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/kwv0djk0/computer/2/u/m/16-e0162ax-gaming-laptop-hp-original-imag9g7ytxnpfvxh.jpeg?q=70',
      pAmout: 58990),
  ProductModel(
      pId: uuid.v4(),
      pName: 'DELL Core i3 12th Gen',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/computer/n/o/s/-original-imaghzah9mjvukjz.jpeg?q=70',
      pAmout: 41990),
  ProductModel(
      pId: uuid.v4(),
      pName: 'RedmiBook Pro Core i5 11th Gen',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/kuwzssw0/computer/x/l/a/redmibook-15-pro-thin-and-light-laptop-redmi-original-imag7xhnakyazyma.jpeg?q=70',
      pAmout: 37990),
  ProductModel(
      pId: uuid.v4(),
      pName: 'APPLE 2020 Macbook Air M1',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/kp5sya80/screen-guard/tempered-glass/o/v/n/apple-macbook-air-m1-13-3-inch-lightwings-original-imag3gh5xftgbpg3.jpeg?q=70',
      pAmout: 84499),
  ProductModel(
      pId: uuid.v4(),
      pName: 'ASUS VivoBook 14 (2021)',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/l2m78280/computer/p/8/b/-original-imagdx9suxvvyhzq.jpeg?q=70',
      pAmout: 21249),
];

var accessories = [
  ProductModel(
      pId: uuid.v4(),
      pName: 'Zoook Bomber Wired Optical Mouse',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/mouse/m/m/t/-original-imaghttrnd4my7mm.jpeg?q=70',
      pAmout: 550),
  ProductModel(
      pId: uuid.v4(),
      pName: 'SanDisk Ultra 32 GB',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/l5iid8w0/memory-card/microsd-card/8/g/i/sdsqua4-032ggn6mn-sandisk-original-imagg6dzju2un2aj.jpeg?q=70',
      pAmout: 511),
  ProductModel(
      pId: uuid.v4(),
      pName: 'OnePlus Band',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/kqv8vww0/smart-band-tag/7/p/y/no-na-w101in-yes-android-ios-oneplus-yes-original-imag4sebkfskhekz.jpeg?q=70',
      pAmout: 3915),
  ProductModel(
      pId: uuid.v4(),
      pName: 'Ambrane 10000 mAh Power Bank',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/shopsy-power-bank/o/l/w/pp-111-10000-ambrane-original-imagg7nprsfvwttp.jpeg?q=70',
      pAmout: 899),
  ProductModel(
      pId: uuid.v4(),
      pName: 'Mi 22.5W Quick Charger',
      pImage:
          'https://rukminim1.flixcart.com/image/832/832/xif0q/battery-charger/g/e/h/-original-imaggwxekxuasfqk.jpeg?q=70',
      pAmout: 699),
];
