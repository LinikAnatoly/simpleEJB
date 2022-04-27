
unit EditFINExecutorTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINExecutorTypeController ;

type
  TfrmFINExecutorTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOFINExecutorType: THTTPRIO;

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
  frmFINExecutorTypeFilterEdit: TfrmFINExecutorTypeFilterEdit;
  FINExecutorTypeFilterObj: FINExecutorTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutorTypeController  ;
}
{$R *.dfm}



procedure TfrmFINExecutorTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := FINExecutorTypeObj.name; 


  end;

}

end;



procedure TfrmFINExecutorTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutorType: FINExecutorTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINExecutorTypeFilterObj.name := edtName.Text; 




  end;
end;




end.