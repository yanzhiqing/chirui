import{o as a,b as n,f as e,g as o,e as s,y as d,i as r}from"./vendor.9f5f26d0.js";import{B as i}from"./blockTitle.8eac420c.js";import{p as l}from"./products.823867b2.js";import{p,H as u}from"./headerProducts.a8931ca3.js";import"./index.b4ce246e.js";const _=s("div",{class:"common-banner"},null,-1),m=r("\u4EA7\u54C1\u5C55\u793A"),f=r("Information Center"),h={class:"page-content"},N={name:"index",setup(b){const c=p.map(t=>(t.url=new URL({}[`/images/products/${t.id}.png`],self.location).href,t));return(t,x)=>(a(),n("div",null,[_,e(i,null,{title:o(()=>[m]),"sub-title":o(()=>[f]),_:1}),s("div",h,[e(u),e(l,{product_list:d(c)},null,8,["product_list"])])]))}};export{N as default};
