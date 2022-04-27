//Редактирование Трансформатора Тока
unit EditENCurrentTransformer;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, ENCurrentTransformerController ;

type
  TfrmENCurrentTransformerEdit = class(TDialogForm)

    lblCode : TLabel;
	  edtCode : TEdit;
    lblAccruracyClass : TLabel;
    edtAccruracyClass: TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblCoefTransformation : TLabel;
    edtCoefTransformation: TEdit;
    lblSecondaryWindingsNumber : TLabel;
    edtSecondaryWindingsNumber: TEdit;
    lblENCurrentTransformerTypeName: TLabel;
    edtENCurrentTransformerTypeName: TEdit;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    lblENHighVoltageSellName: TLabel;
    edtENHighVoltageSellName: TEdit;
    spbENHighVoltageSell: TSpeedButton;
    HTTPRIOENCurrentTransformer: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    lblMaterialsName: TLabel;
    HTTPRIOSpr_matherial: THTTPRIO;
    edtMaterialsName: TEdit;
    spbTkMaterials: TSpeedButton;
    spbENCurrentTransformerType: TSpeedButton;
    lblDispName: TLabel;
    edtDispName: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENCurrentTransformerTypeClick(Sender : TObject);
    procedure spbENElementClick(Sender : TObject);
    procedure spbENHighVoltageSellClick(Sender : TObject);
    procedure spbTkMaterialsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCurrentTransformerEdit: TfrmENCurrentTransformerEdit;
  ENCurrentTransformerObj: ENCurrentTransformer;

implementation

uses
  EditENSubstation04,
  ShowENCurrentTransformerType, ENCurrentTransformerTypeController,
  ShowENElement, ENElementController,
  ShowENHighVoltageSell, ENHighVoltageSellController,
  ShowTKMaterials, TKMaterialsController
;

{$R *.dfm}

procedure TfrmENCurrentTransformerEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
begin
  DisableControls([edtENHighVoltageSellName, edtMaterialsName
    {, edtENCurrentTransformerTypeName}]);
  SetFloatStyle([edtAccruracyClass, edtCoefTransformation]);
  SetIntStyle([edtSecondaryWindingsNumber]);
  if DialogState = dsView then
   begin
    DisableControls([edtENHighVoltageSellName, spbENHighVoltageSell,
      spbTkMaterials, edtMaterialsName
      {, spbENCurrentTransformerType, edtENElementName, spbENElement}]);
   end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtAccruracyClass
      ,edtNumberGen
      ,edtCoefTransformation
      ,edtSecondaryWindingsNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENCurrentTransformerObj.code);
      edtDispName.Text := ENCurrentTransformerObj.name;
      if ( ENCurrentTransformerObj.accruracyClass <> nil ) then
         edtAccruracyClass.Text := ENCurrentTransformerObj.accruracyClass.decimalString
      else
         edtAccruracyClass.Text := ''; 
      if ( ENCurrentTransformerObj.numberGen <> nil ) then
         edtNumberGen.Text := ENCurrentTransformerObj.numberGen.decimalString
      else
         edtNumberGen.Text := ''; 
      if ( ENCurrentTransformerObj.coefTransformation <> nil ) then
         edtCoefTransformation.Text := ENCurrentTransformerObj.coefTransformation.decimalString
      else
         edtCoefTransformation.Text := ''; 
      if ( ENCurrentTransformerObj.secondaryWindingsNumber <> nil ) then
         edtSecondaryWindingsNumber.Text := ENCurrentTransformerObj.secondaryWindingsNumber.decimalString
      else
         edtSecondaryWindingsNumber.Text := ''; 

      edtENHighVoltageSellName.Text := 'Ячейка № ' +
        ENCurrentTransformerObj.highvoltageSell.numberGen;

      if ENCurrentTransformerObj.materialRef <> nil then
        if ENCurrentTransformerObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENCurrentTransformerObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      //edtENCurrentTransformerTypeName.Text := ENCurrentTransformerObj.currentTransformerType.name;
      //edtENElementName.Text := ENCurrentTransformerObj.element.name;
    end;
end;



procedure TfrmENCurrentTransformerEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit)
  or (DialogState = dsInsert)) then
    if not NoBlankValues([edtAccruracyClass, edtCoefTransformation,
      edtSecondaryWindingsNumber, edtMaterialsName {,edtNumberGen}]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),
        PChar('Внимание !'), MB_ICONWARNING+MB_OK);
      Action:=caNone;
    end
  else
  begin
    TempENCurrentTransformer :=
      HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
     ENCurrentTransformerObj.name := edtDispName.Text;
     if (ENCurrentTransformerObj.accruracyClass = nil ) then
       ENCurrentTransformerObj.accruracyClass := TXSDecimal.Create;
     if edtAccruracyClass.Text <> '' then
       ENCurrentTransformerObj.accruracyClass.decimalString := edtAccruracyClass.Text 
     else
       ENCurrentTransformerObj.accruracyClass := nil;

     if (ENCurrentTransformerObj.numberGen = nil ) then
       ENCurrentTransformerObj.numberGen := TXSDecimal.Create;
     {if edtNumberGen.Text <> '' then
       ENCurrentTransformerObj.numberGen.decimalString := edtNumberGen.Text
     else
       ENCurrentTransformerObj.numberGen := nil;}
     ENCurrentTransformerObj.numberGen.decimalString := '1';

     if (ENCurrentTransformerObj.coefTransformation = nil ) then
       ENCurrentTransformerObj.coefTransformation := TXSDecimal.Create;
     if edtCoefTransformation.Text <> '' then
       ENCurrentTransformerObj.coefTransformation.decimalString := edtCoefTransformation.Text 
     else
       ENCurrentTransformerObj.coefTransformation := nil;

     if (ENCurrentTransformerObj.secondaryWindingsNumber = nil ) then
       ENCurrentTransformerObj.secondaryWindingsNumber := TXSDecimal.Create;
     if edtSecondaryWindingsNumber.Text <> '' then
       ENCurrentTransformerObj.secondaryWindingsNumber.decimalString := edtSecondaryWindingsNumber.Text 
     else
       ENCurrentTransformerObj.secondaryWindingsNumber := nil;

    //Поле ТИП ТРАНСФОРМАТОРА ТОКА не актуально
    (*
    if ENCurrentTransformerObj.currentTransformerType <> nil then
      begin
        if ENCurrentTransformerObj.currentTransformerType.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть тип трансформатора тока!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENCurrentTransformerTypeName.CanFocus then
              edtENCurrentTransformerTypeName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть тип трансформатора тока!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENCurrentTransformerTypeName.CanFocus then
          edtENCurrentTransformerTypeName.SetFocus;
        Action := caNone;
        Abort;
      end;*)

    if ENCurrentTransformerObj.highvoltageSell <> nil then
      begin
        if ENCurrentTransformerObj.highvoltageSell.code = low(Integer) then
          begin
            Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
              PChar('Увага '), MB_ICONWARNING + MB_OK);
            if edtENHighVoltageSellName.CanFocus then
              edtENHighVoltageSellName.SetFocus;
            Action := caNone;
            Abort;
          end;
      end
    else
      begin
        Application.MessageBox(PChar('Оберіть високовольтну чарунку!'),
          PChar('Увага !'), MB_ICONWARNING + MB_OK);
        if edtENHighVoltageSellName.CanFocus then
          edtENHighVoltageSellName.SetFocus;
        Action := caNone;
        Abort;
      end;

    if DialogState = dsInsert then
    begin
      ENCurrentTransformerObj.code:=low(Integer);
      TempENCurrentTransformer.add(ENCurrentTransformerObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCurrentTransformer.save(ENCurrentTransformerObj);
    end;
  end;
end;


procedure TfrmENCurrentTransformerEdit.spbENCurrentTransformerTypeClick(Sender : TObject);
//var frmENCurrentTransformerTypeShow: TfrmENCurrentTransformerTypeShow;
begin
   (*frmENCurrentTransformerTypeShow:=TfrmENCurrentTransformerTypeShow.Create(Application,fmNormal);
   try
      with frmENCurrentTransformerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurrentTransformerObj.currentTransformerType = nil then
                 ENCurrentTransformerObj.currentTransformerType := ENCurrentTransformerType.Create();
               ENCurrentTransformerObj.currentTransformerType.code := StrToInt(GetReturnValue(sgENCurrentTransformerType,0));
               edtENCurrentTransformerTypeName.Text:=GetReturnValue(sgENCurrentTransformerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENCurrentTransformerTypeShow.Free;
   end;*)
end;



procedure TfrmENCurrentTransformerEdit.spbENElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurrentTransformerObj.element = nil then ENCurrentTransformerObj.element := ENElement.Create();
               ENCurrentTransformerObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENCurrentTransformerEdit.spbENHighVoltageSellClick(Sender : TObject);
var frmENHighVoltageSellShow: TfrmENHighVoltageSellShow;
  ENHighVoltageSellFilterObj: ENHighVoltageSellFilter;
begin
  ENHighVoltageSellFilterObj := ENHighVoltageSellFilter.Create;
  SetNullIntProps(ENHighVoltageSellFilterObj);
  SetNullXSProps(ENHighVoltageSellFilterObj);

  if ENSubstation04Obj <> nil then
    if ENSubstation04Obj.element <> nil then
      if ENSubstation04Obj.element.code <> Low(Integer) then
        ENHighVoltageSellFilterObj.conditionSQL :=
          ' ENHIGHVOLTAGESELL.ELEMENTCODE in (SELECT E.CODE FROM ENELEMENT E WHERE E.ELEMENTINREFCODE = '
              +  IntToStr(ENSubstation04Obj.element.code) + ')';

  frmENHighVoltageSellShow := TfrmENHighVoltageSellShow.Create(
    Application, fmNormal, ENHighVoltageSellFilterObj);
  try
    with frmENHighVoltageSellShow do
      if ShowModal = mrOk then
        begin
          try
            if ENCurrentTransformerObj.highvoltageSell = nil then
              ENCurrentTransformerObj.highvoltageSell := ENHighVoltageSell.Create();
            ENCurrentTransformerObj.highvoltageSell.code :=
              StrToInt(GetReturnValue(sgENHighVoltageSell, 0));
            edtENHighVoltageSellName.Text :=
              GetReturnValue(sgENHighVoltageSell, 1);
          except
             on EConvertError do Exit;
          end;
        end;
  finally
    frmENHighVoltageSellShow.Free;
  end;
end;

procedure TfrmENCurrentTransformerEdit.spbTkMaterialsClick(
  Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
  //mtFilter : TKMaterialsFilter;
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
          if ENCurrentTransformerObj.materialRef = nil then
            ENCurrentTransformerObj.materialRef := TKMaterialsRef.Create;
          ENCurrentTransformerObj.materialRef.code :=
            TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialsName.Text := TKMaterialsShort(tvDep.Selected.Data).name;
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