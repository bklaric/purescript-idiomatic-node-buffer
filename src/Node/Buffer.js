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

exports.concat = function (buffers) {
    return function (totalLength) {
        return function () {
            return Buffer.Buffer.concat(buffers, totalLength)
        }
    }
}

exports.toString = function (encoding) {
    return function (start) {
        return function (end) {
            return function (buffer) {
                return function () {
                    return buffer.toString(encoding, start, end)
                }
            }
        }
    }
}
