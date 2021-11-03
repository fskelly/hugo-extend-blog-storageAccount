# Blog

This is the backend of my [Azure Storage Account based blog](https://cloudadventures.fskelly.com)

## Current Process flow

1. Create content locally with [Hugo](https://gohugo.io/), I am actuall using the extended version of Hugo based upon my [theme choice](https://github.com/CaiJimmy/hugo-theme-stack)

1. Use ```hugo server``` to display the content locally - great for checking layout and making sure everything works. It builds in real-time which is great.

1. Use ```hugo``` to build the content. It outputs the required static files to your **public** folder by default

1. Use the required ```git``` commands to _add_, _commit_ and _push_ to this Github Repo
   * ```git add .```
   * ```git commit -m "<insert message here>"```
   * ```git push```

1. GitHub actions then push the required files to the **$web** container on my storage account and my website is updated

See below for the badge for the status of this process :smile:

[![Blob storage website CI](https://github.com/fskelly/hugo-extend-blog-storageAccount/actions/workflows/storage-copy-main.yml/badge.svg?branch=main)](https://github.com/fskelly/hugo-extend-blog-storageAccount/actions/workflows/storage-copy-main.yml)  
[![Blob Storage Copy - PreProd](https://github.com/fskelly/hugo-extend-blog-storageAccount/actions/workflows/preprod.yml/badge.svg)](https://github.com/fskelly/hugo-extend-blog-storageAccount/actions/workflows/preprod.yml)
