"use strict";

const Buffer = require("buffer")

exports.undefined = undefined

exports.allocImpl = function (size) {
    return function (fill) {
        return function (encoding) {
            return function () {
                return Buffer.Buffer.alloc(size, fill, encoding)
            }
        }
    }
}

exports.fromStringImpl = function (string) {
    return function (encoding) {
        return function () {
            return Buffer.Buffer.from(string, encoding)
        }
    }
}
