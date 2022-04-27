
unit EditENSO2NodeTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2NodeTypeController ;

type
  TfrmENSO2NodeTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENSO2NodeType: THTTPRIO;

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
  frmENSO2NodeTypeFilterEdit: TfrmENSO2NodeTypeFilterEdit;
  ENSO2NodeTypeFilterObj: ENSO2NodeTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2NodeTypeController  ;
}
{$R *.dfm}



procedure TfrmENSO2NodeTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSO2NodeTypeObj.name; 


  end;

}

end;



procedure TfrmENSO2NodeTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2NodeType: ENSO2NodeTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSO2NodeTypeFilterObj.name := edtName.Text; 




  end;
end;




end.