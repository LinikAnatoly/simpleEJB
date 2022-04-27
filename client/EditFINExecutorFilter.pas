
unit EditFINExecutorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, FINExecutorController ;

type
  TfrmFINExecutorFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;
    lblFinTypeName : TLabel;
    edtFinTypeName: TEdit;
    lblFinTypeCode : TLabel;
    edtFinTypeCode: TEdit;
    lblFinKindName : TLabel;
    edtFinKindName: TEdit;
    lblFinKindCode : TLabel;
    edtFinKindCode: TEdit;
    lblFinCehName : TLabel;
    edtFinCehName: TEdit;
    lblFinCehCode : TLabel;
    edtFinCehCode: TEdit;


  HTTPRIOFINExecutor: THTTPRIO;

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
  frmFINExecutorFilterEdit: TfrmFINExecutorFilterEdit;
  FINExecutorFilterObj: FINExecutorFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, FINExecutorController  ;
}
{$R *.dfm}



procedure TfrmFINExecutorFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtFinCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := FINExecutorObj.name; 



    if ( FINExecutorObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(FINExecutorObj.finCode)
    else
       edtFinCode.Text := '';



    edtFinTypeName.Text := FINExecutorObj.finTypeName; 



    if ( FINExecutorObj.finTypeCode <> Low(Integer) ) then
       edtFinTypeCode.Text := IntToStr(FINExecutorObj.finTypeCode)
    else
       edtFinTypeCode.Text := '';



    edtFinKindName.Text := FINExecutorObj.finKindName; 



    if ( FINExecutorObj.finKindCode <> Low(Integer) ) then
       edtFinKindCode.Text := IntToStr(FINExecutorObj.finKindCode)
    else
       edtFinKindCode.Text := '';



    edtFinCehName.Text := FINExecutorObj.finCehName; 



    if ( FINExecutorObj.finCehCode <> Low(Integer) ) then
       edtFinCehCode.Text := IntToStr(FINExecutorObj.finCehCode)
    else
       edtFinCehCode.Text := '';


  end;

}

end;



procedure TfrmFINExecutorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempFINExecutor: FINExecutorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     FINExecutorFilterObj.name := edtName.Text; 



     if ( edtFinCode.Text <> '' ) then
       FINExecutorFilterObj.finCode := StrToInt(edtFinCode.Text)
     else
       FINExecutorFilterObj.finCode := Low(Integer) ;




     FINExecutorFilterObj.finTypeName := edtFinTypeName.Text; 



     if ( edtFinTypeCode.Text <> '' ) then
       FINExecutorFilterObj.finTypeCode := StrToInt(edtFinTypeCode.Text)
     else
       FINExecutorFilterObj.finTypeCode := Low(Integer) ;




     FINExecutorFilterObj.finKindName := edtFinKindName.Text; 



     if ( edtFinKindCode.Text <> '' ) then
       FINExecutorFilterObj.finKindCode := StrToInt(edtFinKindCode.Text)
     else
       FINExecutorFilterObj.finKindCode := Low(Integer) ;




     FINExecutorFilterObj.finCehName := edtFinCehName.Text; 



     if ( edtFinCehCode.Text <> '' ) then
       FINExecutorFilterObj.finCehCode := StrToInt(edtFinCehCode.Text)
     else
       FINExecutorFilterObj.finCehCode := Low(Integer) ;





  end;
end;




end.