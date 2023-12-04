# NVHTarGzip

## IS

* [ ] https://github.com/nvh/NVHTarGzip/issues/23, works for me, if any shows up, contacts：fengzilijie@qq.com
* [x] https://github.com/nvh/NVHTarGzip/issues/21, fixed
* [x] https://github.com/nvh/NVHTarGzip/issues/19, fixed, NSASCIIStringEncoding -> NSUTF8StringEncoding
* [x] https://github.com/nvh/NVHTarGzip/issues/18, ignored, providing your bug case?
* [x] https://github.com/nvh/NVHTarGzip/issues/17, fixed
* [x] https://github.com/nvh/NVHTarGzip/issues/16, ignored
* [ ] https://github.com/nvh/NVHTarGzip/issues/14, works for me, if any shows up, contacts: fengzilijie@qq.com
* [x] https://github.com/nvh/NVHTarGzip/issues/13, merged
* [ ] https://github.com/nvh/NVHTarGzip/issues/11, TODO:
* [ ] https://github.com/nvh/NVHTarGzip/issues/8, TODO: , clue: I defaulted back to the Light-Untar-for-iOS, and it worked. So not sure why this one wouldn't do it.
* [ ] https://github.com/nvh/NVHTarGzip/issues/7, TODO:

### PR

* [x] https://github.com/nvh/NVHTarGzip/pull/24, merged
* [x] https://github.com/nvh/NVHTarGzip/pull/22, https://github.com/nvh/NVHTarGzip/pull/20, they fixed the bug with cutting off the name when it exceeds, while i use NAME_MAX, if other show up, contacts: fengzilijie@qq.com
* [x] https://github.com/nvh/NVHTarGzip/pull/12, partially merged, reject the fix about NSProgress multithreading issue.

## Usage

### Asynchronous

#### Inflate Gzip file

```objective-c
[[NVHTarGzip sharedInstance] unGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* gzipError) {
    if (gzipError != nil) {
        NSLog(@"Error ungzipping %@", gzipError);
    }
}];
```

#### Untar file

```objective-c
[[NVHTarGzip sharedInstance] unTarFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* tarError) {
    if (tarError != nil) {
        NSLog(@"Error untarring %@", tarError);
    }
}];
```

#### Inflate Gzip and Untar

```objective-c
[[NVHTarGzip sharedInstance] unTarGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* error) {
    if (error != nil) {
        NSLog(@"Error extracting %@", error);
    }
}];
```

#### Deflate Gzip file

```objective-c
[[NVHTarGzip sharedInstance] gzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* gzipError) {
    if (gzipError != nil) {
        NSLog(@"Error gzipping %@", gzipError);
    }
}];
```

#### Tar file

```objective-c
[[NVHTarGzip sharedInstance] tarFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* tarError) {
    if (tarError != nil) {
        NSLog(@"Error tarring %@", tarError);
    }
}];
```

#### Deflate Gzip and Tar

```objective-c
[[NVHTarGzip sharedInstance] tarGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* error) {
    if (error != nil) {
        NSLog(@"Error packing %@", error);
    }
}];
```


### Synchronous

#### Inflate Gzip file

```objective-c
[[NVHTarGzip sharedInstance] unGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* gzipError) {
    if (gzipError != nil) {
        NSLog(@"Error ungzipping %@", gzipError);
    }
}];
```

#### Untar file

```objective-c
[[NVHTarGzip sharedInstance] unTarFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* tarError) {
    if (tarError != nil) {
        NSLog(@"Error untarring %@", tarError);
    }
}];
```

#### Inflate Gzip and Untar

```objective-c
[[NVHTarGzip sharedInstance] unTarGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* error) {
    if (error != nil) {
        NSLog(@"Error extracting %@", error);
    }
}];
```

#### Deflate Gzip file

```objective-c
[[NVHTarGzip sharedInstance] gzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* gzipError) {
    if (gzipError != nil) {
        NSLog(@"Error gzipping %@", gzipError);
    }
}];
```

#### Tar file

```objective-c
[[NVHTarGzip sharedInstance] tarFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* tarError) {
    if (tarError != nil) {
        NSLog(@"Error untarring %@", tarError);
    }
}];
```

#### Deflate Gzip and Tar

```objective-c
[[NVHTarGzip sharedInstance] tarGzipFileAtPath:sourcePath toPath:destinationPath completion:^(NSError* error) {
    if (error != nil) {
        NSLog(@"Error extracting %@", error);
    }
}];
```

##### Note
Sequential `tar.gz` packing and unpacking will either *tar* or *ungzip* the intermediate `tar` file to a temporary-directory, and subsequently *gzip* or *untar* it. After *gzipping*/*untarring*, the temporary-file is deleted. You can customize the cachePath by setting it on the singleton object before extracting:

```objective-c
[[NVHTarGzip sharedInstance] setCachePath:customCachePath];
```

### Progress 

`NVHTarGzip` uses `NSProgress` to handle progress reporting. To keep track of progress create your own progress instance and use KVO to inspect the `fractionCompleted` property. See the [documentation of NSProgress](https://developer.apple.com/library/ios/documentation/Foundation/Reference/NSProgress_Class/Reference/Reference.html) and [this great article](http://oleb.net/blog/2014/03/nsprogress/) by [Ole Begemann](https://github.com/ole) for more information.

```objective-c
NSProgress* progress = [NSProgress progressWithTotalUnitCount:1];
NSString* keyPath = NSStringFromSelector(@selector(fractionCompleted));
[progress addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionInitial context:NVHProgressFractionCompletedObserverContext];
[progress becomeCurrentWithPendingUnitCount:1];
[[NVHTarGzip sharedInstance] unTarGzipFileAtPath:self.demoSourceFilePath toPath:self.demoDestinationFilePath completion:^(NSError* error) {
    [progress resignCurrent];
    [progress removeObserver:self forKeyPath:keyPath];
}];
```

Checkout a full usage example in the example project; clone the repo, and run `pod install` from the Example directory first.

## Todo

Add streaming support (`NSStream`). This would allow the usage of an intermediate file for `tar.gz` packing and unpacking, thus speeding things a bit.

Pull requests are welcome!

* Current benchmark ?

    - Cpu           Almost full payload
    - Memory        Low when TarGzip?
    - Disk          IO high payload
    - Network       None

## Installation

*NVHTarGzip* is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your `Podfile`:

```ruby
pod "NVHTarGzip"
```

## 2th Author

Seven, fengzilijie@qq.com


