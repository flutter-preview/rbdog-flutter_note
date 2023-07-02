'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/NOTICES": "b08c081ccbb746e5ce6f322f5cf1870f",
"assets/assets/stub/level2.json": "1388240b81d6e8baa92e92a8a0092e3a",
"assets/assets/stub/level1.json": "eb4b2328aec085bc4fcb20753a1ff8de",
"assets/assets/stub/level3.json": "acc2a7d26423677b6f458372f984aac7",
"assets/assets/images/dino-fossil.png": "d83bb6adbc9f15a77c4b20424a3533d5",
"assets/assets/images/icon4.png": "e792574202bc22c27a47445964a7414f",
"assets/assets/images/sunflower.png": "c6f370cf5c77da1ca6e21621d308406b",
"assets/assets/images/tab-battle.png": "d73df0823b99818ed2ea7ef06e8a4510",
"assets/assets/images/tab-events.png": "0998bafa95e1620d2d2a15e18f450318",
"assets/assets/images/flower-young.png": "1812402ece70ea4033b99db8b3efa3f5",
"assets/assets/images/cherry-blossom.png": "8584326ebabfe209450d60a0d8ae62b1",
"assets/assets/images/horse5.png": "d282df9afd1a4a33b1b8a3e3cb3d7b16",
"assets/assets/images/tab-clan.png": "642391c8ded208a96e8dba42399b1429",
"assets/assets/images/star-right.png": "2c95917094f9597c419581c03554adfd",
"assets/assets/images/butterfly-pupa.png": "f7992e90a75b9ab652d04e722e488773",
"assets/assets/images/grape.png": "fc91fcb68ff0ddc11cf8798f1dd0c888",
"assets/assets/images/clam-closed.png": "9e1182696aaeb4de4841686e691a4e28",
"assets/assets/images/star-left.png": "7b8c7831e30ec78994a4a2c0da2058b1",
"assets/assets/images/icon8.png": "54fd11e68f6f86533b46894b6b31b8ad",
"assets/assets/images/map.png": "1b76059cef8b6a4d388d81f124d33317",
"assets/assets/images/horse2.png": "414623dc9f4c393e5b185465c998219c",
"assets/assets/images/icon6.png": "8e52c46217df9956aea2c88a8ab74b94",
"assets/assets/images/icon7.png": "4550eb6b94937be1f26f80587f919b83",
"assets/assets/images/apple.png": "302c4057b28b495e5e5116151edf9c0d",
"assets/assets/images/icon5.png": "efbf48ed26003c2d35500f9a6bfe540d",
"assets/assets/images/icon11.png": "1c71638f42d55e2bbbe70881b518be7d",
"assets/assets/images/event.png": "28e62843039d5400a74edf753cd4e3fa",
"assets/assets/images/flower-blossomed.png": "6babb8c5f96cf44e175d646fb3c9d151",
"assets/assets/images/icon1.png": "183b500be22d29596381be7c89827423",
"assets/assets/images/user-icon.png": "e9e4b8fc283e13dbd578c065e8c4928e",
"assets/assets/images/dino-resurrected.png": "e7b5e56743561a3da00c2fbde0fc0a09",
"assets/assets/images/arrow-right.png": "b9387d7ec99b2d90c6efd2c1fae3d9fc",
"assets/assets/images/icon9.png": "3312c44bff9e85d856f37e0df42027fa",
"assets/assets/images/maple.png": "5603ed4c153c418fa72c1e3d6b68eb24",
"assets/assets/images/horse4.png": "dc9df5f4d8bf238307cf242e60238bc6",
"assets/assets/images/silver-coin.png": "c3167e107652fe5ac3a568f1e7da9175",
"assets/assets/images/tab-collection.png": "36bf94bea159f279827b44458a23b5fe",
"assets/assets/images/butterfly-adult.png": "e210a688ac686e461b602ec2d3692fda",
"assets/assets/images/horse3.png": "7d5cf8f4e3115016726d44ead2e38bee",
"assets/assets/images/melon.png": "9124f6e0a3a3592118f599ab0eace686",
"assets/assets/images/narcissus.png": "9e18565be64b42447c2fa831cfa2178e",
"assets/assets/images/gold-coin.png": "6527bfbe311ac47f50e33c1faab1355c",
"assets/assets/images/clam-opened.png": "e481481ec4a4512dbb214828cbbc1a36",
"assets/assets/images/animal-crossing.png": "9034f14fb78ecf2c06372525857e30b2",
"assets/assets/images/icon2.png": "62a3a79ff6f9aa60f4f6ed793f82ea1b",
"assets/assets/images/banana.png": "001100fe6c3c8e7af206c3c2990a0a8d",
"assets/assets/images/horse1.png": "8d4e122e9796a86290bb52ddeaa9595e",
"assets/assets/images/icon10.png": "af1b4e319c7f5afc1d28c387d3fda94b",
"assets/assets/images/games.png": "a6870e7bfda030de9596f7e0683c2e5a",
"assets/assets/images/icon3.png": "8e877f6e94973b99e57d6d583cf22ffc",
"assets/assets/images/sushi.jpeg": "4e94f9379a400b426855597d2d26b5f9",
"assets/assets/images/tab-shop.png": "fd09e827bbc6a6f74e1dda9455b1b501",
"assets/assets/images/arrow-left.png": "71f09eb3031b02763e995820165e230b",
"assets/assets/google_fonts/HachiMaruPop-Regular.ttf": "bc06cd642dd38805281ee75f28cd3604",
"assets/assets/google_fonts/OFL.txt": "2a512c2b2147eaf3928ecd2fe8d8eec7",
"assets/assets/fonts/RussoOne-Regular.ttf": "708e95f0c43a68448ec43fff78931a41",
"assets/assets/fonts/OFL.txt": "328a6ada1f92b557269c6905933f80d3",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "3ec9e5945ed6592c8614b7a074c63882",
"assets/AssetManifest.json": "f94eda076cf594dfb8ea0876b397a618",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"index.html": "0da1d087b9d1a63c4c4eef11a02298ac",
"/": "0da1d087b9d1a63c4c4eef11a02298ac",
"main.dart.js": "a287b48a63d09eb510e49033edfcb8d3",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"version.json": "5e169df758c2610f02af76383cf51dd9",
"manifest.json": "292c43622ab51aede3d0c2d285c64658",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
