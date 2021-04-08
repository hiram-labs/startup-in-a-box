'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('react/jsx-runtime');

/*! *****************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */

var __assign = function() {
    __assign = Object.assign || function __assign(t) {
        for (var s, i = 1, n = arguments.length; i < n; i++) {
            s = arguments[i];
            for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p)) t[p] = s[p];
        }
        return t;
    };
    return __assign.apply(this, arguments);
};

function __rest(s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
}

/**
 * Primary UI component for user interaction
 */
var Button = function (_a) {
    var className = _a.className, _b = _a.primary, primary = _b === void 0 ? false : _b, _c = _a.size, size = _c === void 0 ? "medium" : _c, backgroundColor = _a.backgroundColor, label = _a.label, props = __rest(_a, ["className", "primary", "size", "backgroundColor", "label"]);
    var mode = primary
        ? "storybook-button--primary"
        : "storybook-button--secondary";
    return (jsxRuntime.jsx("button", __assign({ type: "button", className: [
            "storybook-button",
            "storybook-button--" + size,
            mode,
            className,
        ].join(" "), style: { backgroundColor: backgroundColor } }, props, { children: label }), void 0));
};

var Header = function (_a) {
    var user = _a.user, onLogin = _a.onLogin, onLogout = _a.onLogout, onCreateAccount = _a.onCreateAccount;
    return (jsxRuntime.jsx("header", { children: jsxRuntime.jsxs("div", __assign({ className: "wrapper" }, { children: [jsxRuntime.jsxs("div", { children: [jsxRuntime.jsx("svg", __assign({ width: "32", height: "32", viewBox: "0 0 32 32", xmlns: "http://www.w3.org/2000/svg" }, { children: jsxRuntime.jsxs("g", __assign({ fill: "none", fillRule: "evenodd" }, { children: [jsxRuntime.jsx("path", { d: "M10 0h12a10 10 0 0110 10v12a10 10 0 01-10 10H10A10 10 0 010 22V10A10 10 0 0110 0z", fill: "#FFF" }, void 0),
                                    jsxRuntime.jsx("path", { d: "M5.3 10.6l10.4 6v11.1l-10.4-6v-11zm11.4-6.2l9.7 5.5-9.7 5.6V4.4z", fill: "#555AB9" }, void 0),
                                    jsxRuntime.jsx("path", { d: "M27.2 10.6v11.2l-10.5 6V16.5l10.5-6zM15.7 4.4v11L6 10l9.7-5.5z", fill: "#91BAF8" }, void 0)] }), void 0) }), void 0),
                        jsxRuntime.jsx("h1", { children: "Acme" }, void 0)] }, void 0),
                jsxRuntime.jsx("div", { children: user ? (jsxRuntime.jsx(Button, { size: "small", onClick: onLogout, label: "Log out" }, void 0)) : (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(Button, { size: "small", onClick: onLogin, label: "Log in" }, void 0),
                            jsxRuntime.jsx(Button, { primary: true, size: "small", onClick: onCreateAccount, label: "Sign up" }, void 0)] }, void 0)) }, void 0)] }), void 0) }, void 0));
};

var Page = function (_a) {
    var user = _a.user, onLogin = _a.onLogin, onLogout = _a.onLogout, onCreateAccount = _a.onCreateAccount;
    return (jsxRuntime.jsxs("article", { children: [jsxRuntime.jsx(Header, { user: user, onLogin: onLogin, onLogout: onLogout, onCreateAccount: onCreateAccount }, void 0),
            jsxRuntime.jsxs("section", { children: [jsxRuntime.jsx("h2", { children: "Pages in Storybook" }, void 0),
                    jsxRuntime.jsxs("p", { children: ["We recommend building UIs with a", " ", jsxRuntime.jsx("a", __assign({ href: "https://componentdriven.org", target: "_blank", rel: "noopener noreferrer" }, { children: jsxRuntime.jsx("strong", { children: "component-driven" }, void 0) }), void 0), " ", "process starting with atomic components and ending with pages."] }, void 0),
                    jsxRuntime.jsx("p", { children: "Render pages with mock data. This makes it easy to build and review page states without needing to navigate to them in your app. Here are some handy patterns for managing page data in Storybook:" }, void 0),
                    jsxRuntime.jsxs("ul", { children: [jsxRuntime.jsx("li", { children: "Use a higher-level connected component. Storybook helps you compose such data from the \"args\" of child component stories" }, void 0),
                            jsxRuntime.jsx("li", { children: "Assemble data in the page component from your services. You can mock these services out using Storybook." }, void 0)] }, void 0),
                    jsxRuntime.jsxs("p", { children: ["Get a guided tutorial on component-driven development at", " ", jsxRuntime.jsx("a", __assign({ href: "https://www.learnstorybook.com", target: "_blank", rel: "noopener noreferrer" }, { children: "Learn Storybook" }), void 0), ". Read more in the", " ", jsxRuntime.jsx("a", __assign({ href: "https://storybook.js.org/docs", target: "_blank", rel: "noopener noreferrer" }, { children: "docs" }), void 0), "."] }, void 0),
                    jsxRuntime.jsxs("div", __assign({ className: "tip-wrapper" }, { children: [jsxRuntime.jsx("span", __assign({ className: "tip" }, { children: "Tip" }), void 0), " Adjust the width of the canvas with the", " ", jsxRuntime.jsx("svg", __assign({ width: "10", height: "10", viewBox: "0 0 12 12", xmlns: "http://www.w3.org/2000/svg" }, { children: jsxRuntime.jsx("g", __assign({ fill: "none", fillRule: "evenodd" }, { children: jsxRuntime.jsx("path", { d: "M1.5 5.2h4.8c.3 0 .5.2.5.4v5.1c-.1.2-.3.3-.4.3H1.4a.5.5 0 01-.5-.4V5.7c0-.3.2-.5.5-.5zm0-2.1h6.9c.3 0 .5.2.5.4v7a.5.5 0 01-1 0V4H1.5a.5.5 0 010-1zm0-2.1h9c.3 0 .5.2.5.4v9.1a.5.5 0 01-1 0V2H1.5a.5.5 0 010-1zm4.3 5.2H2V10h3.8V6.2z", id: "a", fill: "#999" }, void 0) }), void 0) }), void 0), "Viewports addon in the toolbar"] }), void 0)] }, void 0)] }, void 0));
};

exports.Button = Button;
exports.Header = Header;
exports.Page = Page;
