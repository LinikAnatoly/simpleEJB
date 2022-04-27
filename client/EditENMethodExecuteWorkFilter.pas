
unit EditENMethodExecuteWorkFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMethodExecuteWorkController ;

type
  TfrmENMethodExecuteWorkFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENMethodExecuteWork: THTTPRIO;

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
  frmENMethodExecuteWorkFilterEdit: TfrmENMethodExecuteWorkFilterEdit;
  ENMethodExecuteWorkFilterObj: ENMethodExecuteWorkFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMethodExecuteWorkController  ;
}
{$R *.dfm}



procedure TfrmENMethodExecuteWorkFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMethodExecuteWorkObj.name; 


  end;

}

end;



procedure TfrmENMethodExecuteWorkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMethodExecuteWork: ENMethodExecuteWorkControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMethodExecuteWorkFilterObj.name := edtName.Text; 




  end;
end;




end.