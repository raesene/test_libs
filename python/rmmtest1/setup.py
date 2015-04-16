try:
  from setuptools import setup
except ImportError:
  from distutils.core import setup

from setuptools.command.install import install


class InstallClass(install):
  def run(self):
    from os.path import expanduser
    home = expanduser("~")
    fo = open(home + "/rmmtest1_test.txt", "a+")
    fo.write("testing testing 1,2,3 testing")
    install.run(self)

setup(
  description='A Test Library that does not do anything',
  author='Rory McCune',
  url='https://github.com/raesene/test_libs',
  download_url='https://github.com/raesene/test_libs',
  author_email='raesene@gmail.com',
  version='0.1',
  install_requires=['nose'],
  packages=['rmmtest1'],
  scripts='',
  license='MIT',
  name='rmmtest1',
  cmdclass={
    'install': InstallClass,
  }
)





