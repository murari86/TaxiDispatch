(function(){var n,t=[].indexOf||function(n){for(var t=0,i=this.length;i>t;t++)if(t in this&&this[t]===n)return t;return-1};n=["extended","included"],this.Gmaps.Base=function(){function i(){}return i.extend=function(i){var e,r,l;for(e in i)r=i[e],t.call(n,e)<0&&(this[e]=r);return null!=(l=i.extended)&&l.apply(this),this},i.include=function(i){var e,r,l;for(e in i)r=i[e],t.call(n,e)<0&&(this.prototype[e]=r);return null!=(l=i.included)&&l.apply(this),this},i}()}).call(this);