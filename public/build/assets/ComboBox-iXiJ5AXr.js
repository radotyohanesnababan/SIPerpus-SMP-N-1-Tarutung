import{r as x,j as a}from"./app-BKrs4JKw.js";import{B as u,c as C}from"./button-Czh_Alhb.js";import{C as j,a as v,b as f,c as b,d as g,e as k}from"./command-B5KMtO2F.js";import{P as y,a as I,b as w}from"./popover-DA2FeR8Q.js";import{c as l}from"./createReactComponent-knH6_BB8.js";/**
 * @license @tabler/icons-react v3.31.0 - MIT
 *
 * This source code is licensed under the MIT license.
 * See the LICENSE file in the root directory of this source tree.
 */var P=l("outline","caret-left","IconCaretLeft",[["path",{d:"M14 6l-6 6l6 6v-12",key:"svg-0"}]]);/**
 * @license @tabler/icons-react v3.31.0 - MIT
 *
 * This source code is licensed under the MIT license.
 * See the LICENSE file in the root directory of this source tree.
 */var N=l("outline","check","IconCheck",[["path",{d:"M5 12l5 5l10 -10",key:"svg-0"}]]);function O({items:o,selectedItem:t,onSelect:i,placeholder:c="Pilih item..."},...m){var r;const[s,n]=x.useState(!1),p=e=>{i(parseInt(e,10)),n(!1)};return a.jsxs(y,{open:s,onOpenChange:n,children:[a.jsx(I,{asChild:!0,children:a.jsxs(u,{variant:"outline",type:"button",role:"combobox","aria-expanded":s,className:"w-full justify-between",...m,children:[((r=o.find(e=>e.value==t))==null?void 0:r.label)??"Pilih item",a.jsx(P,{className:"ml-2 h-4 w-4 shrink-0 opacity-50"})]})}),a.jsx(w,{className:"max-h-[--radix-popover-content-available-height] w-[--radix-popover-trigger-width] p-0",align:"start",children:a.jsxs(j,{children:[a.jsx(v,{placeholder:c,className:"h-9"}),a.jsxs(f,{children:[a.jsx(b,{children:"Item tidak ditemukan"}),a.jsx(g,{children:o.map((e,d)=>a.jsxs(k,{value:e.value,onSelect:h=>p(h),children:[e.label,a.jsx(N,{className:C("ml-auto h-4 w-4",t===e.label?"opacity-100":"opacity-0")})]},d))})]})]})})]})}export{O as C};
//# sourceMappingURL=ComboBox-iXiJ5AXr.js.map
