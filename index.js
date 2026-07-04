const http = require("http")
const WebSocket = require("ws")

const server = http.createServer()

const s = new WebSocket.Server({
    server
})

server.listen(process.env.PORT || 8080, () => {
    console.log("we up")
})

s.on("connection", (c, r) => {
    console.log("bro joined", r.socket.remoteAddress)

    c.send(JSON.stringify({
        type: "handshake_ack"
    }))

    const h = setInterval(() => {
        if (c.readyState === WebSocket.OPEN) {
            c.send(JSON.stringify({
                type: "heartbeat",
                t: Date.now()
            }))
        }
    }, 5000)

    c.on("message", m => {
        let j

        try {
            j = JSON.parse(m.toString())
        } catch {
            console.log("bro cant json 💀")
            return
        }

        console.log(`got ${j.type} #${j.id}`)

        if (j.type === "ping") {
            c.send(JSON.stringify({
                type: "pong",
                id: j.id
            }))
            return
        }

        if (j.type === "echo") {
            c.send(JSON.stringify({
                type: "echo",
                id: j.id,
                m: j.m
            }))
            return
        }

        if (j.type === "hello") {
            console.log("locked in with", j.client)
        }
    })

    c.on("close", () => {
        clearInterval(h)
        console.log("bro dipped")
    })

    c.on("error", e => {
        console.log("L", e.message)
    })
})
