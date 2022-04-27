
unit EditFINMolDataFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINMolDataController ;

type
  TfrmFINMolDataFilterEdit = class(TDialogForm)

    lblFinMolCode : TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName : TLabel;
    edtFinMolName: TEdit;


  HTTPRIOFINMolData: THTTPRIO;

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
  frmFINMolDataFilterEdit: TfrmFINMolDataFilterEdit;
  FINMolDataFilterObj: FINMolDataFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINMolDataController  ;
}
{$R *.dfm}



procedure TfrmFINMolDataFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinMolCode
      ,edtFinMolName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtFinMolCode.Text := FINMolDataObj.finMolCode; 



    edtFinMolName.Text := FINMolDataObj.finMolName; 


  end;

}

end;



procedure TfrmFINMolDataFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINMolData: FINMolDataControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINMolDataFilterObj.finMolCode := edtFinMolCode.Text; 



     FINMolDataFilterObj.finMolName := edtFinMolName.Text; 




  end;
end;




end.