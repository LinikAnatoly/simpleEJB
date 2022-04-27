
unit EditRQOrderKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrderKindController ;

type
  TfrmRQOrderKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQOrderKind: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQOrderKindFilterEdit: TfrmRQOrderKindFilterEdit;
  RQOrderKindFilterObj: RQOrderKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrderKindController  ;
}
{$R *.dfm}



procedure TfrmRQOrderKindFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQOrderKindObj.name; 


  end;

}

end;



procedure TfrmRQOrderKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrderKind: RQOrderKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQOrderKindFilterObj.name := edtName.Text; 




  end;
end;




end.