
unit EditENWires;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresController ;

type
  TfrmENWiresEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblCountWires : TLabel;
    edtCountWires: TEdit;
    lblWireLength : TLabel;
    edtWireLength: TEdit;
    lblExternOrg : TLabel;
    memExternOrg: TMemo;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    HTTPRIOENWires: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    chkbxIsCabel: TCheckBox;
    chkbxIsRadio: TCheckBox;
    chkbxIsIllumination: TCheckBox;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementClick(Sender : TObject);
    procedure chkbxIsCabelClick(Sender: TObject);
    procedure chkbxIsRadioClick(Sender: TObject);
    procedure spbTkMaterialsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var frmENWiresEdit: TfrmENWiresEdit; ENWiresObj: ENWires;

implementation

uses ShowENElement, ENElementController, ShowTKMaterials, TKMaterialsController;

{$R *.dfm}



procedure TfrmENWiresEdit.FormShow(Sender: TObject);
begin
  if DialogState = dsView then
    DisableControls([edtENElementName, spbENElement]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([edtNumberGen, edtCountWires, {memExternOrg,} chkbxIsCabel,
      chkbxIsRadio, chkbxIsIllumination]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENWiresObj.code);
    edtNumberGen.Text := ENWiresObj.numberGen;
    if ( ENWiresObj.countWires <> Low(Integer) ) then
       edtCountWires.Text := IntToStr(ENWiresObj.countWires)
    else
       edtCountWires.Text := '';
    if (ENWiresObj.wireLength <> nil) then
       edtWireLength.Text := ENWiresObj.wireLength.decimalString
    else
       edtWireLength.Text := '';
    MakeMultiline(memExternOrg.Lines, ENWiresObj.externOrg);
    if (ENWiresObj.isCabel <> Low(Integer)) then
      chkbxIsCabel.Checked := (ENWiresObj.isCabel = 1)
    else
      chkbxIsCabel.Checked := False;
    if chkbxIsCabel.Checked then
      chkbxIsCabel.Caption := 'Кабель'
    else
      chkbxIsCabel.Caption := 'Провод';

    if (ENWiresObj.isRadio <> Low(Integer)) then
      chkbxIsRadio.Checked := (ENWiresObj.isRadio = 1)
    else
      chkbxIsRadio.Checked := False;
    if chkbxIsRadio.Checked then
      chkbxIsRadio.Caption := 'Радіо'
    else
      chkbxIsRadio.Caption := 'Фідер';
    if (ENWiresObj.isIllumination <> Low(Integer)) then
      chkbxIsIllumination.Checked := (ENWiresObj.isIllumination = 1)
    else
      chkbxIsIllumination.Checked := False;
    //edtENElementName.Text := ENWiresObj.element.name;
  end;
end;



procedure TfrmENWiresEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWires: ENWiresControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtCountWires
      {,memExternOrg}
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENWires := HTTPRIOENWires as ENWiresControllerSoapPort;


     ENWiresObj.numberGen := edtNumberGen.Text; 

     if ( edtCountWires.Text <> '' ) then
       ENWiresObj.countWires := StrToInt(edtCountWires.Text)
     else
       ENWiresObj.countWires := Low(Integer) ;

     if (ENWiresObj.wireLength = nil ) then
       ENWiresObj.wireLength := TXSDecimal.Create;
     if edtWireLength.Text <> '' then
       ENWiresObj.wireLength.decimalString := edtWireLength.Text 
     else
       ENWiresObj.wireLength := nil;

     ENWiresObj.externOrg := memExternOrg.Text; 

     if chkbxIsCabel.Checked then
       ENWiresObj.isCabel := 1
     else
       ENWiresObj.isCabel := 0;

     if chkbxIsRadio.Checked then
       ENWiresObj.isRadio := 1
     else
       ENWiresObj.isRadio := 0;

     if chkbxIsIllumination.Checked then
       ENWiresObj.isIllumination := 1
     else
       ENWiresObj.isIllumination := 0;

    if DialogState = dsInsert then
    begin
      ENWiresObj.code:=low(Integer);
      TempENWires.add(ENWiresObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWires.save(ENWiresObj);
    end;
  end;
end;


procedure TfrmENWiresEdit.spbENElementClick(Sender : TObject);
//var frmENElementShow: TfrmENElementShow;
begin
   (*frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENWiresObj.element = nil then ENWiresObj.element := ENElement.Create();
               ENWiresObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;*)
end;

procedure TfrmENWiresEdit.chkbxIsCabelClick(Sender: TObject);
begin
  if chkbxIsCabel.Checked then
    chkbxIsCabel.Caption := 'Кабель'
  else
    chkbxIsCabel.Caption := 'Провод';
end;

procedure TfrmENWiresEdit.chkbxIsRadioClick(Sender: TObject);
begin
  if chkbxIsRadio.Checked then
    chkbxIsRadio.Caption := 'Радіо'
  else
    chkbxIsRadio.Caption := 'Фідер';
end;

procedure TfrmENWiresEdit.spbTkMaterialsClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter; //Исключено объявление не используемых переменных
begin
  if DialogState = dsView then Exit;
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);
  try
    with frmSpr_matherialShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        DenyGroupSelection := true;
        if ShowModal = mrOk then
        begin
          try
            if ENWiresObj.matWireRef = nil then
              ENWiresObj.matWireRef := TKMaterialsRef.Create;
            ENWiresObj.matWireRef.code :=
              TKMaterialsShort(tvDep.Selected.Data).code;
            edtMaterialsName.Text :=
              TKMaterialsShort(tvDep.Selected.Data).name;
          except
            on EConvertError do Exit;
          end;
        end;
      end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
