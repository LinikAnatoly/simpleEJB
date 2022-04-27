
unit EditRQPackingListItemTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListItemTypeController ;

type
  TfrmRQPackingListItemTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQPackingListItemType: THTTPRIO;

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
  frmRQPackingListItemTypeFilterEdit: TfrmRQPackingListItemTypeFilterEdit;
  RQPackingListItemTypeFilterObj: RQPackingListItemTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPackingListItemTypeController  ;
}
{$R *.dfm}



procedure TfrmRQPackingListItemTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQPackingListItemTypeObj.name; 


  end;

}

end;



procedure TfrmRQPackingListItemTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListItemType: RQPackingListItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPackingListItemTypeFilterObj.name := edtName.Text; 




  end;
end;




end.