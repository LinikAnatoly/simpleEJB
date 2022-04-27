 unit aboutEnergyNet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  DialogFormUnit
  ;

type
  TfrmAbout = class(TDialogForm)
    versionDescriptor: TMemo;
    btnOk: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation



{$R *.dfm}

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  inherited;
  versionDescriptor.ReadOnly := true;
end;

end.
