Write-Host "Building Flutter Web release..." -ForegroundColor Cyan
flutter build web --release

Write-Host "Packaging build for Vercel..." -ForegroundColor Cyan
Remove-Item -Recurse -Force .vercel/output -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force -Path .vercel/output/static | Out-Null
Copy-Item -Recurse -Force build/web/* .vercel/output/static/

$config = @'
{
  "version": 3,
  "routes": [
    { "handle": "filesystem" },
    { "src": "/(.*)", "dest": "/index.html" }
  ]
}
'@
Set-Content -Path .vercel/output/config.json -Value $config

Write-Host "Deploying to Vercel Production..." -ForegroundColor Green
vercel deploy --prebuilt --prod --yes
