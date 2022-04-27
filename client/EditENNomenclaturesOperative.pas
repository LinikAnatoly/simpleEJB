
unit EditENNomenclaturesOperative;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENNomenclaturesOperativeController ;

type
  TfrmENNomenclaturesOperativeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblId : TLabel;
    edtId: TEdit;
    lblNn : TLabel;
    edtNn: TEdit;
    lblBal_sch : TLabel;
    edtBal_sch: TEdit;
    lblName : TLabel;


  HTTPRIOENNomenclaturesOperative: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbNomenclature: TSpeedButton;
    edtName: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbNomenclatureClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNomenclaturesOperativeEdit: TfrmENNomenclaturesOperativeEdit;
  ENNomenclaturesOperativeObj: ENNomenclaturesOperative;

implementation

uses ShowTmaterial, TmaterialController;


{uses  
    EnergyproController, EnergyproController2, ENNomenclaturesOperativeController  ;
}
{$R *.dfm}



procedure TfrmENNomenclaturesOperativeEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtId, edtNn, edtBal_sch, edtName, edtCode]);
  SetIntStyle(edtId);

  if DialogState = dsView then
  begin
    DisableControls([spbNomenclature]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtId
      ,edtNn
      ,edtBal_sch
      ,edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENNomenclaturesOperativeObj.code);
    if ( ENNomenclaturesOperativeObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(ENNomenclaturesOperativeObj.id)
    else
       edtId.Text := '';
    edtNn.Text := ENNomenclaturesOperativeObj.nn; 
    edtBal_sch.Text := ENNomenclaturesOperativeObj.bal_sch;
    edtName.Text := ENNomenclaturesOperativeObj.name;
  end;
end;



procedure TfrmENNomenclaturesOperativeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENNomenclaturesOperative: ENNomenclaturesOperativeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtId
      ,edtNn
      ,edtBal_sch
      ,edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENNomenclaturesOperative := HTTPRIOENNomenclaturesOperative as ENNomenclaturesOperativeControllerSoapPort;

    if ( edtId.Text <> '' ) then
      ENNomenclaturesOperativeObj.id := StrToInt(edtId.Text)
    else
      ENNomenclaturesOperativeObj.id := Low(Integer) ;

    ENNomenclaturesOperativeObj.nn := edtNn.Text;

    ENNomenclaturesOperativeObj.bal_sch := edtBal_sch.Text;

    ENNomenclaturesOperativeObj.name := edtName.Text;

    if DialogState = dsInsert then
    begin
      ENNomenclaturesOperativeObj.code:=low(Integer);
      TempENNomenclaturesOperative.add(ENNomenclaturesOperativeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENNomenclaturesOperative.save(ENNomenclaturesOperativeObj);
    end;
  end;
end;


procedure TfrmENNomenclaturesOperativeEdit.spbNomenclatureClick(
  Sender: TObject);
var
   frmTmaterialShow: TfrmTmaterialShow;
   nomFilter : TmaterialFilter;
   id: Integer;
begin
   nomFilter := TmaterialFilter.Create;
   SetNullIntProps(nomFilter);
   SetNullXSProps(nomFilter);

   // нет такого поля .. вернее оно не обрабатываеться ;) nomFilter.status := 'A';

   nomFilter.conditionSQL := 'UMC_DBA.TMATHERIAL.STATUS = ''A''';
   nomFilter.orderBySQL := 'UMC_DBA.TMATHERIAL.NAME';
   
   frmTmaterialShow:=TfrmTmaterialShow.Create(Application, fmNormal, nomFilter);
   try
     frmTmaterialShow.ShowFilter := true;

     with frmTmaterialShow do
       if ShowModal = mrOk then
       begin
         try
           id := StrToInt(GetReturnValue(frmTmaterialShow.sgTmaterial,0));
           edtId.Text := IntToStr(id); //GetReturnValue(frmTmaterialShow.sgTmaterial,0);
           edtNn.Text := GetReturnValue(frmTmaterialShow.sgTmaterial,1);
           edtBal_sch.Text := GetReturnValue(frmTmaterialShow.sgTmaterial,2);
           edtName.Text := GetReturnValue(frmTmaterialShow.sgTmaterial,3);
           //nomenclatureUnitCode := StrToInt(GetReturnValue(frmTmaterialShow.sgTmaterial,4));
           //nomenclatureUnitName := GetReturnValue(frmTmaterialShow.sgTmaterial,5);
         except
           on EConvertError do Exit;
         end;
       end;
   finally
     frmTmaterialShow.Free;
   end;
end;

end.