## NASM
cd ~/ffmpeg_sources && \
tar xjvf nasm-2.13.03.tar.bz2 && \
cd nasm-2.13.03 && \
./autogen.sh && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make && \
make install \
cd

## Yasm
cd ~/ffmpeg_sources && \
tar xzvf yasm-1.3.0.tar.gz && \
cd yasm-1.3.0 && \
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" && \
make && \
make install \
cd


## libx264

cd ~/ffmpeg_sources/x264 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --enable-shared --enable-pic && \
PATH="$HOME/bin:$PATH" make && \
make install


## libx265
cd ~/ffmpeg_sources/x265/build/linux && \
PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED=on ../../source && \
PATH="$HOME/bin:$PATH" make && \
make install


## libvpx
cd ~/ffmpeg_sources && \
tar xzvf libvpx.1.7.0.tar.gz && \
cd libvpx-1.7.0 && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests \
--enable-shared --enable-pic \
--enable-vp9-highbitdepth --as=yasm && \
PATH="$HOME/bin:$PATH" make && \
make install

## fdk-aac

cd ~/ffmpeg_sources && \
cd fdk-aac && \
autoreconf -fiv && \
./configure --prefix="$HOME/ffmpeg_build" --enable-shared && \
make && \
make install


## lame
cd ~/ffmpeg_sources && \
tar xzvf lame-3.99.5.tar.gz && \
cd lame-3.99.5 && \
PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" \
--enable-shared \
--with-pic \
--enable-nasm && \
PATH="$HOME/bin:$PATH" make && \
make install


## lib opus
cd ~/ffmpeg_sources && \
cd opus && \
./autogen.sh && \
./configure --prefix="$HOME/ffmpeg_build" --enable-shared && \
make && \
make install


######
cd ~/ffmpeg_sources && \
tar xjvf ffmpeg-3.4.2.tar.bz2 && \
cd ffmpeg-3.4.2 && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --bindir="$HOME/bin" \
  --enable-shared --enable-pic \
  --enable-gpl \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree && \
PATH="$HOME/bin:$PATH" make && \
make install && \
hash -r
