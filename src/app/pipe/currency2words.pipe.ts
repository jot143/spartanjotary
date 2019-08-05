import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'currency2words'
})
export class Currency2wordsPipe implements PipeTransform {

  transform($number: any, args?: any): any {
    let $no: any = Math.round($number);
    const tempPoint = Number($number - $no).toFixed(2);
    let $point: any = Number(tempPoint) * 100;
    let $hundred = null;

    const $digitsOne = $no.toString().length;
    let $i = 0;
    let $str = [];
    const $words = { 0 : '', 1 : 'ONE', 2 : 'TWO',
        3 : 'THREE', 4 : 'FOUR', 5 : 'FIVE', 6 : 'SIX',
        7 : 'SEVEN', 8 : 'EIGHT', 9 : 'NINE',
        10 : 'TEN', 11 : 'ELEVEN', 12 : 'TWELVE',
        13 : 'THIRTEEN', 14 : 'FOURTEEN',
        15 : 'FIIFTEEN', 16 : 'SIXTEEN', 17 : 'SEVENTEEN',
        18 : 'EIGHTEEN', 19 : 'NINETEEN', 20 : 'TWENTY',
        30 : 'THIRTY', 40 : 'FORTY', 50 : 'FIFTY',
        60 : 'SIXTY', 70 : 'SEVENTY',
        80 : 'EIGHTY', 90 : 'NINETY'};

    const $digits = ['', 'HUNDERED', 'THOUSAND', 'LAKH', 'CRORE'];
    while ($i < $digitsOne) {
         // tslint:disable-next-line:triple-equals
         const $divider = ($i == 2) ? 10 : 100;
         $number = Math.floor($no % $divider);
         $no = Math.floor($no / $divider);
         // tslint:disable-next-line:triple-equals
         $i += ($divider == 10) ? 1 : 2;
         if ($number) {
            // tslint:disable-next-line:no-conditional-assignment
            const $counter: any = $str.length;

            const $plural = ($counter && $number > 9) ? 'S' : null;
            // tslint:disable-next-line:triple-equals
            $hundred = ($counter == 1 && $str[0]) ? ' AND ' : null;
            $str.push( ($number < 21) ? $words[$number] +
                ' ' + $digits[$counter] +  $plural + ' ' + $hundred
                :
                $words[Math.floor($number / 10) * 10]
                + ' ' + $words[$number % 10] + ' '
                + $digits[$counter] + $plural + ' ' + $hundred
                );
         } else {
           $str = null;
         }
      }
    $str = $str.reverse();
    const $result = $str.join();
    const $points = ($point) ?
        ' AND ' + $words[$point / 10] + ' ' + $words[$point = $point % 10] : '';

    return $result + 'RUPEES  ' + $points + ' PAISE ONLY';
  }

}
