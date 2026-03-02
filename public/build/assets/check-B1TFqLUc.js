import{r as i,j as p,t as $}from"./app-BKrs4JKw.js";function O(e,t){const o=i.createContext(t),u=r=>{const{children:n,...s}=r,a=i.useMemo(()=>s,Object.values(s));return p.jsx(o.Provider,{value:a,children:n})};u.displayName=e+"Provider";function c(r){const n=i.useContext(o);if(n)return n;if(t!==void 0)return t;throw new Error(`\`${r}\` must be used within \`${e}\``)}return[u,c]}function I(e,t=[]){let o=[];function u(r,n){const s=i.createContext(n),a=o.length;o=[...o,n];const l=d=>{var b;const{scope:h,children:x,...m}=d,C=((b=h==null?void 0:h[e])==null?void 0:b[a])||s,y=i.useMemo(()=>m,Object.values(m));return p.jsx(C.Provider,{value:y,children:x})};l.displayName=r+"Provider";function f(d,h){var C;const x=((C=h==null?void 0:h[e])==null?void 0:C[a])||s,m=i.useContext(x);if(m)return m;if(n!==void 0)return n;throw new Error(`\`${d}\` must be used within \`${r}\``)}return[l,f]}const c=()=>{const r=o.map(n=>i.createContext(n));return function(s){const a=(s==null?void 0:s[e])||r;return i.useMemo(()=>({[`__scope${e}`]:{...s,[e]:a}}),[s,a])}};return c.scopeName=e,[u,g(c,...t)]}function g(...e){const t=e[0];if(e.length===1)return t;const o=()=>{const u=e.map(c=>({useScope:c(),scopeName:c.scopeName}));return function(r){const n=u.reduce((s,{useScope:a,scopeName:l})=>{const d=a(r)[`__scope${l}`];return{...s,...d}},{});return i.useMemo(()=>({[`__scope${t.scopeName}`]:n}),[n])}};return o.scopeName=t.scopeName,o}function U(e,t,{checkForDefaultPrevented:o=!0}={}){return function(c){if(e==null||e(c),o===!1||!c.defaultPrevented)return t==null?void 0:t(c)}}var w=globalThis!=null&&globalThis.document?i.useLayoutEffect:()=>{},P=$[" useInsertionEffect ".trim().toString()]||w;function W({prop:e,defaultProp:t,onChange:o=()=>{},caller:u}){const[c,r,n]=k({defaultProp:t,onChange:o}),s=e!==void 0,a=s?e:c;{const f=i.useRef(e!==void 0);i.useEffect(()=>{const d=f.current;d!==s&&console.warn(`${u} is changing from ${d?"controlled":"uncontrolled"} to ${s?"controlled":"uncontrolled"}. Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component.`),f.current=s},[s,u])}const l=i.useCallback(f=>{var d;if(s){const h=A(f)?f(e):f;h!==e&&((d=n.current)==null||d.call(n,h))}else r(f)},[s,e,r,n]);return[a,l]}function k({defaultProp:e,onChange:t}){const[o,u]=i.useState(e),c=i.useRef(o),r=i.useRef(t);return P(()=>{r.current=t},[t]),i.useEffect(()=>{var n;c.current!==o&&((n=r.current)==null||n.call(r,o),c.current=o)},[o,c]),[o,u,r]}function A(e){return typeof e=="function"}function N(e){const[t,o]=i.useState(void 0);return w(()=>{if(e){o({width:e.offsetWidth,height:e.offsetHeight});const u=new ResizeObserver(c=>{if(!Array.isArray(c)||!c.length)return;const r=c[0];let n,s;if("borderBoxSize"in r){const a=r.borderBoxSize,l=Array.isArray(a)?a[0]:a;n=l.inlineSize,s=l.blockSize}else n=e.offsetWidth,s=e.offsetHeight;o({width:n,height:s})});return u.observe(e,{box:"border-box"}),()=>u.unobserve(e)}else o(void 0)},[e]),t}/**
 * @license lucide-react v0.503.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const z=e=>e.replace(/([a-z0-9])([A-Z])/g,"$1-$2").toLowerCase(),_=e=>e.replace(/^([A-Z])|[\s-_]+(\w)/g,(t,o,u)=>u?u.toUpperCase():o.toLowerCase()),v=e=>{const t=_(e);return t.charAt(0).toUpperCase()+t.slice(1)},S=(...e)=>e.filter((t,o,u)=>!!t&&t.trim()!==""&&u.indexOf(t)===o).join(" ").trim(),j=e=>{for(const t in e)if(t.startsWith("aria-")||t==="role"||t==="title")return!0};/**
 * @license lucide-react v0.503.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */var E={xmlns:"http://www.w3.org/2000/svg",width:24,height:24,viewBox:"0 0 24 24",fill:"none",stroke:"currentColor",strokeWidth:2,strokeLinecap:"round",strokeLinejoin:"round"};/**
 * @license lucide-react v0.503.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const L=i.forwardRef(({color:e="currentColor",size:t=24,strokeWidth:o=2,absoluteStrokeWidth:u,className:c="",children:r,iconNode:n,...s},a)=>i.createElement("svg",{ref:a,...E,width:t,height:t,stroke:e,strokeWidth:u?Number(o)*24/Number(t):o,className:S("lucide",c),...!r&&!j(s)&&{"aria-hidden":"true"},...s},[...n.map(([l,f])=>i.createElement(l,f)),...Array.isArray(r)?r:[r]]));/**
 * @license lucide-react v0.503.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const R=(e,t)=>{const o=i.forwardRef(({className:u,...c},r)=>i.createElement(L,{ref:r,iconNode:t,className:S(`lucide-${z(v(e))}`,`lucide-${e}`,u),...c}));return o.displayName=v(e),o};/**
 * @license lucide-react v0.503.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const B=[["path",{d:"M20 6 9 17l-5-5",key:"1gmf2c"}]],Z=R("check",B);export{Z as C,I as a,W as b,R as c,U as d,N as e,O as f,w as u};
//# sourceMappingURL=check-B1TFqLUc.js.map
