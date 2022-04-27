
unit EditFINAccountTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINAccountTypeController ;

type
  TfrmFINAccountTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOFINAccountType: THTTPRIO;

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
  frmFINAccountTypeFilterEdit: TfrmFINAccountTypeFilterEdit;
  FINAccountTypeFilterObj: FINAccountTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINAccountTypeController  ;
}
{$R *.dfm}



procedure TfrmFINAccountTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := FINAccountTypeObj.name; 


  end;

}

end;



procedure TfrmFINAccountTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINAccountType: FINAccountTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINAccountTypeFilterObj.name := edtName.Text; 




  end;
end;




end.