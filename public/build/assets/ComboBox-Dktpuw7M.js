import{r as x,j as e}from"./app-BApSQQNa.js";import{B as u,a as C}from"./button-CnaDM-Rk.js";import{C as j,a as f,b as v,c as b,d as g,e as k}from"./command-02tayNVU.js";import{P as y,a as N,b as w}from"./popover-BTB8Ifp_.js";import{c as l}from"./createReactComponent-rj6HtphI.js";/**
 * @license @tabler/icons-react v3.41.1 - MIT
 *
 * This source code is licensed under the MIT license.
 * See the LICENSE file in the root directory of this source tree.
 */const P=[["path",{d:"M14 6l-6 6l6 6v-12",key:"svg-0"}]],I=l("outline","caret-left","CaretLeft",P);/**
 * @license @tabler/icons-react v3.41.1 - MIT
 *
 * This source code is licensed under the MIT license.
 * See the LICENSE file in the root directory of this source tree.
 */const _=[["path",{d:"M5 12l5 5l10 -10",key:"svg-0"}]],B=l("outline","check","Check",_);function R({items:o,selectedItem:t,onSelect:i,placeholder:c="Pilih item..."},...m){var r;const[s,n]=x.useState(!1),p=a=>{i(parseInt(a,10)),n(!1)};return e.jsxs(y,{open:s,onOpenChange:n,children:[e.jsx(N,{asChild:!0,children:e.jsxs(u,{variant:"outline",type:"button",role:"combobox","aria-expanded":s,className:"w-full justify-between",...m,children:[((r=o.find(a=>a.value==t))==null?void 0:r.label)??"Pilih item",e.jsx(I,{className:"ml-2 h-4 w-4 shrink-0 opacity-50"})]})}),e.jsx(w,{className:"max-h-[--radix-popover-content-available-height] w-[--radix-popover-trigger-width] p-0",align:"start",children:e.jsxs(j,{children:[e.jsx(f,{placeholder:c,className:"h-9"}),e.jsxs(v,{children:[e.jsx(b,{children:"Item tidak ditemukan"}),e.jsx(g,{children:o.map((a,d)=>e.jsxs(k,{value:a.value,onSelect:h=>p(h),children:[a.label,e.jsx(B,{className:C("ml-auto h-4 w-4",t===a.label?"opacity-100":"opacity-0")})]},d))})]})]})})]})}export{R as C};
//# sourceMappingURL=ComboBox-Dktpuw7M.js.map
