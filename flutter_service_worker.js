'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1fb26e9d370d6c526360212cd0106c4e",
"version.json": "3fe4fd5df2020acccdd334a29a3cc4f4",
"index.html": "94df353e693ff636f6b478f1cf43ebd8",
"/": "94df353e693ff636f6b478f1cf43ebd8",
"main.dart.js": "d93528266db735c064867a0bf3af3d49",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "cf45190907d344e52142f1d5a28e5da7",
"assets/AssetManifest.json": "1f09b0de99f03d6097c6770b2ebcccef",
"assets/NOTICES": "fc6a8297e06c344028c286288079005b",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "6b98728a264e105614faba9f2706898f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "269f971cec0d5dc864fe9ae080b19e23",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "262525e2081311609d1fdab966c82bfc",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "7f33ec733aab7d97b25eb088313f931f",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b03546d2a44b05151ec45e862d18d902",
"assets/fonts/MaterialIcons-Regular.otf": "7a0e2a3b21be3b4817859181ef90206d",
"assets/assets/images/limecar_partner/4.jpg": "237da72c3a7d53cd0c2b093a5164cade",
"assets/assets/images/limecar_partner/2.jpg": "85a90570cca3c36da7c26959e9c30366",
"assets/assets/images/limecar_partner/3.jpg": "67d7fd002b59fcc27616c97e68bc7719",
"assets/assets/images/limecar_partner/1.jpg": "931c9bcb38d3163c2e63d08c8ab9a555",
"assets/assets/images/cookierush_partner/4.jpg": "525fec8276a9e920d22c9abb17c4c0cd",
"assets/assets/images/cookierush_partner/2.jpg": "b59e5997803314672fb4cb434f8e3abd",
"assets/assets/images/cookierush_partner/3.jpg": "bb2cd53dc9853b382c940866e1f52957",
"assets/assets/images/cookierush_partner/1.jpg": "4efaea27e9843c3172eb8b91f82cd7f5",
"assets/assets/images/sportIt/2.jpg": "4c33e006477ed34ce4d293442a2a863d",
"assets/assets/images/sportIt/3.jpg": "7b977bd65a656bc3409540e206fc4078",
"assets/assets/images/sportIt/1.jpg": "f4eec3854f79463e5793bfd77eca20fe",
"assets/assets/images/limecar_app/4.png": "029e8cc27c09d1d9cf775ba71d5dafa4",
"assets/assets/images/limecar_app/5.png": "7c6a88277fb378bff836f9bcb667c3af",
"assets/assets/images/limecar_app/2.png": "31c155781f5e400ee97d4c13f2d26d6b",
"assets/assets/images/limecar_app/3.png": "43f28d766a645ce287bd1b7ba6270de0",
"assets/assets/images/limecar_app/1.png": "d993c3615768ce20ad4b90cf7f4dfec0",
"assets/assets/images/nudge/4.png": "b366bfa8c252c09c39276734d83da94d",
"assets/assets/images/nudge/2.png": "e09ef7fbb60fd2ddd4d46dac30463679",
"assets/assets/images/nudge/3.png": "47de52d18e3e3ec5fa44cd815e51d9b4",
"assets/assets/images/nudge/1.png": "0de7b1b393ea10632d86e78bd63f53ac",
"assets/assets/images/cookierush_customer/4.png": "8e83d99cf52f83ab8eb003f15b97f354",
"assets/assets/images/cookierush_customer/2.png": "75ab7cb44ebd19e33ec7119a89ebbe44",
"assets/assets/images/cookierush_customer/3.png": "6c97273a526c502b523ef52b98a181e1",
"assets/assets/images/cookierush_customer/1.png": "956b796cca49bc106538fa046009172b",
"assets/assets/images/salcete_pharma/4.png": "5f77e0f2a9ac41c4edc6caebd85f338a",
"assets/assets/images/salcete_pharma/2.png": "596795274bb03ea94c9f5144fd797746",
"assets/assets/images/salcete_pharma/3.png": "e455d1444aef601f3cf02260c5ec5121",
"assets/assets/images/salcete_pharma/1.png": "3631fe061196667736e26224e684e3db",
"assets/assets/placeholder.png": "619400c77e00d97f3668a764dfcd00fd",
"assets/assets/my_pic.jpeg": "6cb17760cd10ea3cb3da62c7d430a02b",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
