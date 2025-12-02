'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a731758dbc89abed1f577480279d31b7",
"assets/AssetManifest.bin.json": "73c5fdc254a2b502469c4eaa8ec8aeb0",
"assets/AssetManifest.json": "90e6041a760c94d7bcbb386ef5fb2d6a",
"assets/assets/data/heroes.json": "1331c23021255c4dbec2e76b6be910b3",
"assets/assets/images/heroes/aamon.png": "c9e4d330229c88b1e78ef88ce9db4223",
"assets/assets/images/heroes/akai.png": "809a19d0ffb6cd1b33d0f6d5715f8952",
"assets/assets/images/heroes/aldous.png": "c2f6866ffc797395ee35f97a74bbea20",
"assets/assets/images/heroes/alice.png": "ec3d5c825e893947a235ea9ea59fff77",
"assets/assets/images/heroes/alpha.png": "d3993266ec8b303b02c845f2c75d5e6d",
"assets/assets/images/heroes/alucard.png": "df695a059c0f0a63fe922786098089cd",
"assets/assets/images/heroes/angela.png": "a815a3adad8df99481700c84abaf3c41",
"assets/assets/images/heroes/argus.png": "ee4f9ddb2f82ef0dfc99bb72e0a8f557",
"assets/assets/images/heroes/arlott.png": "01450fec4397f8780ce0d11ab652c73d",
"assets/assets/images/heroes/atlas.png": "0dc01e8286bc92e5be3a3503dd47229c",
"assets/assets/images/heroes/aulus.png": "55751a5c47dc36cb6c1da705c5f5c687",
"assets/assets/images/heroes/aurora.png": "1f3f900f917956e81d7764b9e5ffeb3d",
"assets/assets/images/heroes/badang.png": "484caceb9611d547774d6d936519a7d6",
"assets/assets/images/heroes/balmond.png": "6c018674ea709972b4837ec90518e79e",
"assets/assets/images/heroes/bane.png": "846a816f7905f17c81cb35e7f3ff1c3e",
"assets/assets/images/heroes/barats.png": "2ff4a47ddc77ec9e4e5a522fd696d2c4",
"assets/assets/images/heroes/baxia.png": "ae43a252fda0fe996322ea8d27a6fe69",
"assets/assets/images/heroes/beatrix.png": "c1acd7cbd828f0c5d291e48a0f7c018d",
"assets/assets/images/heroes/belerick.png": "c9aa12fe3c58449075a5ac8b6d691a13",
"assets/assets/images/heroes/benedetta.png": "eceefa7ba07f093d71a30852f0051b7a",
"assets/assets/images/heroes/brody.png": "dc8216bde520fd7be7a2e9e6fad90191",
"assets/assets/images/heroes/bruno.png": "68d7ca30f69cb691125e3f03cd782a53",
"assets/assets/images/heroes/carmilla.png": "358d6ad9cff97fc3bfef8a2bd4acbadd",
"assets/assets/images/heroes/cecilion.png": "af02ce891528cd3576858589d8d33d8d",
"assets/assets/images/heroes/chang_e.png": "4a2db83b0fb92b826f039955d1b8b5df",
"assets/assets/images/heroes/chip.png": "85e15c66733cab7d8d73f7f725f31f1e",
"assets/assets/images/heroes/chou.png": "850c4b51e3dbab3fd12a718917eaaf44",
"assets/assets/images/heroes/cici.png": "4f970eb4b44b8c9fff2c511d8e856ff4",
"assets/assets/images/heroes/claude.png": "808e898e89986b917e146a9b5dcbbb57",
"assets/assets/images/heroes/clint.png": "ffb96ce8d57c9987401f9c5bfebee3b2",
"assets/assets/images/heroes/cyclops.png": "71c31e9801e7d1b40604d54099b30054",
"assets/assets/images/heroes/diggie.png": "7a7a688cf1562a124f7183b2c2957608",
"assets/assets/images/heroes/dyrroth.png": "bf8dcb20923cee2407563e0fe88aa557",
"assets/assets/images/heroes/edith.png": "352f65059bc1180ae0fc066003d628e0",
"assets/assets/images/heroes/esmeralda.png": "f684768281faab70dea48d06fb72979e",
"assets/assets/images/heroes/estes.png": "a3619b68f415405f0a1ad77be31eb64d",
"assets/assets/images/heroes/eudora.png": "3e9c8286caaff10bd0f0844545198163",
"assets/assets/images/heroes/fanny.png": "8ea3a95fa3c726ed0338c0fdd21ad991",
"assets/assets/images/heroes/faramis.png": "4bed236fc260d9924b030e576793a26b",
"assets/assets/images/heroes/floryn.png": "5168f0a54304b2f20f976a1ffa96e1dc",
"assets/assets/images/heroes/franco.png": "d9a0d6432cc0610a2232b2d2ed5e09ce",
"assets/assets/images/heroes/fredrinn.png": "3f574825bd9192094f047a4abc6d5d05",
"assets/assets/images/heroes/freya.png": "b95ffc5769380f10a409d864d4162433",
"assets/assets/images/heroes/gatotkaca.png": "e3ccd096c9c4649519d736073acca91a",
"assets/assets/images/heroes/gloo.png": "8b401d50920f2359060a9c7a3c833df1",
"assets/assets/images/heroes/gord.png": "6ba16b4ca438152a629e7706cbd7453d",
"assets/assets/images/heroes/granger.png": "9ed57f48f91012fd110935258cd1ab61",
"assets/assets/images/heroes/grock.png": "517b20f98bf1859bc57f5cc1b477b0e8",
"assets/assets/images/heroes/guinevere.png": "a34258a6365097da09d9513b620bc14a",
"assets/assets/images/heroes/gusion.png": "82dbd20a7d0f274520895007898199e0",
"assets/assets/images/heroes/hanabi.png": "85d213390613bbc09220cf1d9f64c5c0",
"assets/assets/images/heroes/hanzo.png": "746725e15c7577be6bb92b2665adf447",
"assets/assets/images/heroes/harith.png": "0f81a3d82eb05c2c062fc6ea8b3d6578",
"assets/assets/images/heroes/harley.png": "503566ddaa4727778929dee4b3a01807",
"assets/assets/images/heroes/hayabusa.png": "63cb1f44bf906b71767a000e38d8ab14",
"assets/assets/images/heroes/helcurt.png": "30daa55001c1add0bdc5db5de2dfb4ea",
"assets/assets/images/heroes/hilda.png": "ee3a714054edf41ae09dd0c33faf07de",
"assets/assets/images/heroes/hylos.png": "22d8716de16d99253671c2f9e59d9ef3",
"assets/assets/images/heroes/irithel.png": "5af934fae1b64f1c689a346741a49858",
"assets/assets/images/heroes/ixia.png": "c5f758bd1141327d36f2c77928268ab7",
"assets/assets/images/heroes/jawhead.png": "4448132d3f9d89dc706883d148e50884",
"assets/assets/images/heroes/johnson.png": "9939e5cc09011a287a989b7d4b3aec4d",
"assets/assets/images/heroes/joy.png": "6b5570b0e557e36501b4228fcdfcf164",
"assets/assets/images/heroes/julian.png": "44891c699fb1c00fc4a7fa59ea95b8b3",
"assets/assets/images/heroes/kadita.png": "db76619a5d692aff3f78e3ff8d075a35",
"assets/assets/images/heroes/kagura.png": "634196d9234babcc3072155d4fefaf0c",
"assets/assets/images/heroes/kaja.png": "87a88d7acc62a25869a5316147f3ce6a",
"assets/assets/images/heroes/kalea.png": "9c5f2904026ba88b7aba8c9b2722f4ad",
"assets/assets/images/heroes/karina.png": "4685e0fb17e2fabaf9cb23f8db8fa262",
"assets/assets/images/heroes/karrie.png": "4a4cb5e4c5df81e1fea1b75ab3b774b7",
"assets/assets/images/heroes/khaleed.png": "216ea76d9188164c58950885b3962ba1",
"assets/assets/images/heroes/khufra.png": "5e137ba2f4b8c5a6cd113926f8e8387b",
"assets/assets/images/heroes/kimmy.png": "3fa938873a71f33898f26b19db654b7d",
"assets/assets/images/heroes/lancelot.png": "aa4070a1eb5a53e1824bc9b2d9a47ed2",
"assets/assets/images/heroes/lapu_lapu.png": "b72b473b98494269cedbba84d4888409",
"assets/assets/images/heroes/layla.png": "6efe9abc2047f59d45fa1c88fb1261b7",
"assets/assets/images/heroes/leomord.png": "6c205605c520867a534e4e74588a7208",
"assets/assets/images/heroes/lesley.png": "2bd608ac82a1af4783c5d0fff0c280dc",
"assets/assets/images/heroes/ling.png": "d687aa0d81a24d505169ef6b26fc9bae",
"assets/assets/images/heroes/lolita.png": "55de18c865efe8e360b3b9ae463d76a2",
"assets/assets/images/heroes/lukas.png": "454c13b2de7b7d1a20fbf553c620510d",
"assets/assets/images/heroes/lunox.png": "69d35cd0c549a9bdbcf9fbfddf3122a5",
"assets/assets/images/heroes/luo_yi.png": "74fe63bd31cc092aed923543a115b7bd",
"assets/assets/images/heroes/lylia.png": "5814b1901de2d5713e04b47e36d305e0",
"assets/assets/images/heroes/martis.png": "9691f86f84a553ea3982014738905f3f",
"assets/assets/images/heroes/masha.png": "6fcd3a37b34ea16ca6b485b88220e400",
"assets/assets/images/heroes/mathilda.png": "c3d601a8f6a69409359083ba599f0bb6",
"assets/assets/images/heroes/melissa.png": "8044c8e2e966533e8978b20f4ecb5cd9",
"assets/assets/images/heroes/minotaur.png": "3b7cb3a2be4264d3927f3b5a5050117a",
"assets/assets/images/heroes/minsitthar.png": "dbfdfa2d0a3cc95cbc197d0a14d5ecd1",
"assets/assets/images/heroes/miya.png": "32c0d9d3a727a9052754296af6251435",
"assets/assets/images/heroes/moskov.png": "9cf1a5936ac506d5e1b911be097acfb7",
"assets/assets/images/heroes/nana.png": "ce58cae711d0907a722de0e65fbb85b7",
"assets/assets/images/heroes/natalia.png": "ee09a1367736f8a46641f07f5d1d6618",
"assets/assets/images/heroes/natan.png": "6736ef8c230d82576c3710e9fc248e11",
"assets/assets/images/heroes/nolan.png": "0495066df0d828c149e7fe89aa63078b",
"assets/assets/images/heroes/novaria.png": "12c811236741ae8e3fbdaa2d884b30a2",
"assets/assets/images/heroes/obsidia.png": "92bcc9ad2c4c8165a888d34f086a4d28",
"assets/assets/images/heroes/odette.png": "6fd1d8e4d436d1de3102a7880cd61cbd",
"assets/assets/images/heroes/paquito.png": "1986ebcc24fc3eb28f59f079c15be612",
"assets/assets/images/heroes/pharsa.png": "cccf53dbeacc789288ebc1fb63fcf7dd",
"assets/assets/images/heroes/phoveus.png": "6bfe8ca7e60623a5261eac20e2b39d34",
"assets/assets/images/heroes/popol_and_kupa.png": "30e98c9005e54b1625712892560ad9ab",
"assets/assets/images/heroes/rafaela.png": "f22e22659e8b1acfb665aec8eaffabd7",
"assets/assets/images/heroes/roger.png": "168335bcb95f73c6d653ec4971420923",
"assets/assets/images/heroes/ruby.png": "5b9d38f9f2e7ca03f9f489de19656bc9",
"assets/assets/images/heroes/saber.png": "b5980d535886303ad116fba3463c76ce",
"assets/assets/images/heroes/selena.png": "547ce6e3351ef7a46c02b51d0c4e452c",
"assets/assets/images/heroes/silvanna.png": "fe98dd2e19bb6c29591763d1d11a3eb7",
"assets/assets/images/heroes/sun.png": "eb0864090b1d5307dfeba628de0d294a",
"assets/assets/images/heroes/suyou.png": "422ffc7849e8bb01629d2423054ed410",
"assets/assets/images/heroes/terizla.png": "fcfbde52476bad8c8e67951240de854c",
"assets/assets/images/heroes/thamuz.png": "3e7e133556af2f5d82f49fa8624b6bd5",
"assets/assets/images/heroes/tigreal.png": "4e0005dbfb1376beaccc54ef7aa39375",
"assets/assets/images/heroes/uranus.png": "04a36899ac866eecb1d3a9c436cfb1d9",
"assets/assets/images/heroes/vale.png": "344849c04f420fda542682b73c3f31d1",
"assets/assets/images/heroes/valentina.png": "7923ebf470d0e963e9978cb21eb25780",
"assets/assets/images/heroes/valir.png": "cd4c780c0ed639e2889c1131e56638ec",
"assets/assets/images/heroes/vexana.png": "39c9058219c59535e9ed07645c8d9dd3",
"assets/assets/images/heroes/wanwan.png": "c042bfb106853182a8c38ae5386ceb77",
"assets/assets/images/heroes/xavier.png": "50a5b0dd98ed2378d9f618e5ef0d47b2",
"assets/assets/images/heroes/x_borg.png": "cc433460d0b2053a3d3a18b46462bfb2",
"assets/assets/images/heroes/yin.png": "95836476311e2026077d87eb2373a281",
"assets/assets/images/heroes/yi_sun_shin.png": "3fe7fdb5f2aedef505f3728c28572e2e",
"assets/assets/images/heroes/yu_zhong.png": "7d5ad4d511f5257137028f19e9ee973f",
"assets/assets/images/heroes/yve.png": "d8cc30b9d273a81bd838afc691852b6f",
"assets/assets/images/heroes/zetian.png": "22dc8b16ea98a735027c3141b74ef841",
"assets/assets/images/heroes/zhask.png": "7e69b480400b37dd75614f0c8d033c37",
"assets/assets/images/heroes/zhuxin.png": "13cfeec4bec7a27a09677e519f1ef9d2",
"assets/assets/images/heroes/zilong.png": "6ed2ac1fc08f2b5118b579b188289ca1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "801b9071543607c1d4f3cca9116d1cee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "d4210200fcb0342d0830cc527161199e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "13bb67fa1ca7acfe915ab5dee31b41f9",
"/": "13bb67fa1ca7acfe915ab5dee31b41f9",
"main.dart.js": "d8758d2f499a2af8d98e025dc631666b",
"manifest.json": "930ba528eaf830cfdb6062c9ab3a57cc",
"version.json": "a0b8a3fc181c672655e633b23ca3836f"};
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
