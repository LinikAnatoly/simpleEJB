
unit EditKartiFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TKTechCardController ;

type
  TfrmKartiFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblNumGen : TLabel;
    edtNumGen: TEdit;


  HTTPRIOKarti: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Label1: TLabel;
    cbKDepartment: TComboBox;
    Label2: TLabel;
    cbObject: TComboBox;
    Label3: TLabel;
    cbNorms: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmKartiFilterEdit: TfrmKartiFilterEdit;
  KartiFilterObj: KartiFilter;

implementation



{$R *.dfm}



procedure TfrmKartiFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := KartiObj.name; 



    edtNumGen.Text := KartiObj.numGen; 


  end;

}

end;



procedure TfrmKartiFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempKarti: TKTechCardControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     KartiFilterObj.name := edtName.Text;

     KartiFilterObj.numGen := edtNumGen.Text;
     
     {
     if cbKDepartment.ItemIndex > 0 then
     begin
       KartiFilterObj.departmentRefCode := -1;
     end;
     }

     if cbObject.ItemIndex >= 0 then
     begin
       KartiFilterObj.objectTypeRefCode := cbObject.ItemIndex + 2;
     end;

     if cbNorms.ItemIndex >= 0 then
     begin
       case cbNorms.ItemIndex of
         0 : KartiFilterObj.normaRefCode := 1;
         1 : KartiFilterObj.normaRefCode := 2;
         2 : KartiFilterObj.normaRefCode := 5;
         3 : KartiFilterObj.normaRefCode := 20;
       end;
     end;

  end;
end;




end.
