
unit EditENMarkFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMarkController ;

type
  TfrmENMarkFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMark: THTTPRIO;

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
  frmENMarkFilterEdit: TfrmENMarkFilterEdit;
  ENMarkFilterObj: ENMarkFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMarkController  ;
}
{$R *.dfm}



procedure TfrmENMarkFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENMarkObj.name; 


  end;

}

end;



procedure TfrmENMarkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMark: ENMarkControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMarkFilterObj.name := edtName.Text; 




  end;
end;




end.