
unit EditENObjCrossDownFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENObjCrossDownController ;

type
  TfrmENObjCrossDownFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENObjCrossDown: THTTPRIO;

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
  frmENObjCrossDownFilterEdit: TfrmENObjCrossDownFilterEdit;
  ENObjCrossDownFilterObj: ENObjCrossDownFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENObjCrossDownController  ;
}
{$R *.dfm}



procedure TfrmENObjCrossDownFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENObjCrossDownObj.name; 


  end;

}

end;



procedure TfrmENObjCrossDownFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENObjCrossDownFilterObj.name := edtName.Text; 




  end;
end;




end.