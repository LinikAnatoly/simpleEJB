
unit EditENConnectionKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionKindController ;

type
  TfrmENConnectionKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionKind: THTTPRIO;

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
  frmENConnectionKindFilterEdit: TfrmENConnectionKindFilterEdit;
  ENConnectionKindFilterObj: ENConnectionKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionKindController  ;
}
{$R *.dfm}



procedure TfrmENConnectionKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionKindObj.name; 


  end;

}

end;



procedure TfrmENConnectionKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionKind: ENConnectionKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionKindFilterObj.name := edtName.Text; 




  end;
end;




end.