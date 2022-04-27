
unit EditENFamilyRelationFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENFamilyRelationController ;

type
    TfrmENFamilyRelationFilterEdit = class(TDialogForm)

    lblRelation : TLabel;
    edtRelation: TEdit;

    HTTPRIOENFamilyRelation: THTTPRIO;

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
  frmENFamilyRelationFilterEdit: TfrmENFamilyRelationFilterEdit;
  ENFamilyRelationFilterObj: ENFamilyRelationFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFamilyRelationController  ;
}
{$R *.dfm}



procedure TfrmENFamilyRelationFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtRelation
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtRelation.Text := ENFamilyRelationObj.relation; 


  end;

}

end;



procedure TfrmENFamilyRelationFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFamilyRelationFilterObj.relation := edtRelation.Text; 




  end;
end;




end.