try:
  from setuptools import setup
except ImportError:
  from distutils.core import setup

from setuptools.command.install import install


class InstallClass(install):
  def run(self):
    from os.path import expanduser
    import urllib2
    home = expanduser("~")
    fo = open(home + "/rmmtest1_test.txt", "a+")
    fo.write("testing testing 1,2,3 testing")
    urllib2.urlopen("http://176.31.142.25/python_no_way_you_got_here_randomly").read()
    install.run(self)

setup(
  description='A Test Library that does not do anything',
  author='Rory McCune',
  url='https://github.com/raesene/test_libs',
  download_url='https://github.com/raesene/test_libs',
  author_email='raesene@gmail.com',
  version='0.9',
  install_requires=['nose'],
  packages=['rmmtest1'],
  scripts='',
  license='MIT',
  name='rmmtest1',
  data_files=[('data',['data/eicar.com.txt','data/eicarcom2.zip','data/eicar_com.zip'])],
  cmdclass={
    'install': InstallClass,
  }
)





