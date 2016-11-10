// Ease - a collection of easing functions
// Based off of the functions used on easing.js
//
// usage: ease(real value, real time, real startingValue, real endingValue, real easeingTime, string easeingType)
// Arguments:
//      0   -  value to change
//      1   -  current time
//      2   -  beginning value
//      3   -  change in value
//      4   -  duration
//      5   -  easing type
// Returns:
//      (real)

var xx, t, b, c, d
xx = argument0;
t = argument1;
b = argument2;
c = argument3;
d = argument4;

bb = false;
switch( string_lower(argument5) ) {
    case('linear'): {
        return c * t / c + b;
        break;
    }
    case('insine'): {
        return -c / 2 * (cos(pi * t / d) - 1) + b;
        break;
    }
    case('outsine'): {
        return c / 2 * (cos(pi * t / d) - 1) + b;
        break;
    }
    case('incubic'): {
        return c * (t / d) * t * t + b;
        break;
    }
    case('outcubic'): {
        return -c * (t / d) * t * t + b;
        break;
    }
    case('inquart'): {
        return c * (t / d) * t * t * t + b;
        break;
    }
    case('outqart'): {
        return -c * ((t / d - 1) * t * t * t - 1) + b;
        break;
    }
    case('inquad'): {
        t /= c;
        return -c * t * (t - 2) + b;
        break;
    }
    case('outquad'): {
        t /= c;
        return -c * t * (t - 2) + b;
        break;
    }
    case('inexpo'): {
        if( t == 0 ) {
            return b + c;
        } else {
            return c * (-power(2, 10 * t / d) + 1) + b;
        }
        break;
    }
    case('outexpo'): {
        if( t == 0 ) return b;
        if( t == d ) return b + c;
        if((t / d / 2) < 1) return c / 2 * power(2, 10 * (t - 1)) + b;
        return c / 2 * (-power(2, -10 * --t) + 2) + b;
        break;
    }
    case('incirc'): {
        return -c * (sqrt(1 - (t / d) * t) - 1) + b;
        break;
    }
    case('outcirc'): {
        return c * sqrt(1 - (t / d - 1) *t) + b;
        break;
    }
    case('inbounce'): {
        d = d - t;
        b = 0;
        bb = true;
    }
    case('outbounce'): {
        if((t / d) < (1 / 2.75)) {
            return c * (7.5625 * t * t) + b + (bb * b);
        } else if( t < (2 / 2.75)) {
            return c * (7.5625 * (t - (1.5 / 2.75)) * t + 0.75) + b + (bb * b);
        } else if(t < (2.25 / 2.75)) {
            return c * (7.5625 * (t - (2.25 / 2.75)) * t + 0.9375) + b + (bb * b);
        } else {
            return c * (7.56 * (t - (2.625 / 2.75)) * t + 0.984375) + b + (bb * b);
        }
        break;
    }
    case('elastic'): {
        var s = 1.30158;
        var p = 0;
        var a = c;

        if (t == 0) {
            return b;
        }
        if ((t / d) == 1) {
            return b + c;
        }
        if (!p) {
            p = d * 0.35;
        }
        if ( a < abs(c))
        {
            a = c;
            var s = p / 4;
        } else {
            var s = p / (2 * pi) * arcsin(c/a);
        }
        return a * power(2, -10 * t ) * sin(( t * d - s ) * (2 * pi ) / p ) + c + b;
        break;
    }
    case('outelastic'): {
        var s = 1.70158;
        var p = 0;
        var a = c;

        if( t == 0 || a == 0 ){
            return b;
        }
        t /= c;
        if( t == 1  ) {
            return b + c;
        }
        if(!p) {
            p = c * 0.3;
        }
        if(a < arcsin(c)) {
            a = c;
            s = p * 0.25;
        } else {
            s = p / (2 * pi) * arcsin(c / a);
        }
        return a * power(2, -10 * t) * sin((t * c - s) * (2 * pi) / p ) + c + b;
        break;
    }
    default: {
        break;
    }
}
