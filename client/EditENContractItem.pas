
unit EditENContractItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContractItemController ;

type
  TfrmENContractItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblPrice : TLabel;
    edtPrice: TEdit;
    lblCost : TLabel;
    edtCost: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblTKMaterialsMaterialName : TLabel;
  edtTKMaterialsMaterialName : TEdit;
  spbTKMaterialsMaterial : TSpeedButton;
  
  lblENContractContractName : TLabel;
  edtENContractContractName : TEdit;
  spbENContractContract : TSpeedButton;
  

  HTTPRIOENContractItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    spbMaterialName: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    lblMeasurement: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDeliveryDate: TLabel;
    edtMaterialName: TEdit;
    lblCountReal: TLabel;
    edtCountReal: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKMaterialsMaterialClick(Sender : TObject);
  procedure spbENContractContractClick(Sender : TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCountGenChange(Sender: TObject);
    procedure RecalcCost;
  private
    { Private declarations }
    materialCode: Integer;
  public
    { Public declarations }
    contractCode: Integer;
  end;

var
  frmENContractItemEdit: TfrmENContractItemEdit;
  ENContractItemObj: ENContractItem;

implementation

uses
  ShowTKMaterials
  ,TKMaterialsController
  ,ShowENContract
  ,ENContractController
, ENConsts {, ShowENContractItem};

{uses  
    EnergyproController, EnergyproController2, ENContractItemController  ;
}
{$R *.dfm}



procedure TfrmENContractItemEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle([edtCountGen, edtPrice, edtCost , edtCountReal]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtTKMaterialsMaterialName
      ,spbTKMaterialsMaterial
      ,edtENContractContractName
      ,spbENContractContract
      ,spbMaterialName
      ,spbMaterialClear
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtCode, edtMaterialName, edtENContractContractName, spbENContractContract]);
    DenyBlankValues([
			edtCountGen
			,edtCountReal
      //,edtPrice
      //,edtCost
      ,edtMaterialName
      ,edtENContractContractName
     ]);

    if DialogState = dsInsert then
      HideControls([lblCode, edtCode]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENContractItemObj.code);
		if ( ENContractItemObj.countGen <> nil ) then
			 edtCountGen.Text := ENContractItemObj.countGen.decimalString
    else
			 edtCountGen.Text := '';
    if ( ENContractItemObj.price <> nil ) then
       edtPrice.Text := ENContractItemObj.price.decimalString
    else
       edtPrice.Text := ''; 
    if ( ENContractItemObj.cost <> nil ) then
       edtCost.Text := ENContractItemObj.cost.decimalString
    else
       edtCost.Text := ''; 
    edtCommentGen.Text := ENContractItemObj.commentGen; 

    //edtTKMaterialsMaterialName.Text := ENContractItemObj.material.name;
    edtMaterialName.Text := ENContractItemObj.material.name;

    //edtENContractContractName.Text := ENContractItemObj.contract.name;
    edtENContractContractName.Text := '№' + ENContractItemObj.contract.contractNumber +
                                      ' від ' + DateToStr(EncodeDate(ENContractItemObj.contract.contractDate.Year,
                                                                     ENContractItemObj.contract.contractDate.Month,
																																		 ENContractItemObj.contract.contractDate.Day));

		if ( ENContractItemObj.countReal <> nil ) then
			 edtCountReal.Text := ENContractItemObj.countReal.decimalString
		else
			 edtCountReal.Text := '';
  end;
end;



procedure TfrmENContractItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContractItem: ENContractItemControllerSoapPort;
    contractItemObj: ENContractItem;
    contractItemCode: Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtENContractContractName
      ,edtMaterialName
			,edtCountGen
			,edtCountReal
      //,edtPrice
      //,edtCost
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;


     if (ENContractItemObj.countGen = nil ) then
       ENContractItemObj.countGen := TXSDecimal.Create;
		 if edtCountGen.Text <> '' then
			 ENContractItemObj.countGen.decimalString := edtCountGen.Text
     else
			 ENContractItemObj.countGen := nil;

			 ENContractItemObj.countReal := TXSDecimal.Create;
			 if edtCountReal.Text <> '' then
			 ENContractItemObj.countReal.decimalString := edtCountReal.Text
		 else
			 ENContractItemObj.countReal := nil;

     if (ENContractItemObj.price = nil ) then
       ENContractItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENContractItemObj.price.decimalString := edtPrice.Text 
     else
       ENContractItemObj.price := nil;

     if (ENContractItemObj.cost = nil ) then
       ENContractItemObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENContractItemObj.cost.decimalString := edtCost.Text 
     else
       ENContractItemObj.cost := nil;

     ENContractItemObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENContractItemObj.code:=low(Integer);
      contractItemCode := TempENContractItem.add(ENContractItemObj);
      ///// Надо вытянуть код договора, если он только что добавился на серваке
      // (чтобы потом в Show-е вытянуть по нему итемы)
      if ENContractItemObj.contract.code = LOW_INT then
      begin
        contractItemObj := TempENContractItem.getObject(contractItemCode);
        if contractItemObj <> nil then
          if contractItemObj.contract <> nil then
            contractCode := contractItemObj.contract.code;
      end;
      /////
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContractItem.save(ENContractItemObj);
    end;
  end;
end;


procedure TfrmENContractItemEdit.spbTKMaterialsMaterialClick(Sender : TObject);
var 
   frmTKMaterialsShow: TfrmTKMaterialsShow;
begin
   frmTKMaterialsShow:=TfrmTKMaterialsShow.Create(Application,fmNormal);
   try
      with frmTKMaterialsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractItemObj.material = nil then ENContractItemObj.material := TKMaterials.Create();
               //ENContractItemObj.material.code := StrToInt(GetReturnValue(sgTKMaterials,0));
               //edtTKMaterialsMaterialName.Text:=GetReturnValue(sgTKMaterials,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKMaterialsShow.Free;
   end;
end;



procedure TfrmENContractItemEdit.spbENContractContractClick(Sender : TObject);
var 
   frmENContractShow: TfrmENContractShow;
begin
{
   frmENContractShow:=TfrmENContractShow.Create(Application,fmNormal);
   try
      with frmENContractShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractItemObj.contract = nil then ENContractItemObj.contract := ENContract.Create();
               ENContractItemObj.contract.code := StrToInt(GetReturnValue(sgENContract,0));
               edtENContractContractName.Text:=GetReturnValue(sgENContract,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENContractShow.Free;
   end;
}
end;



procedure TfrmENContractItemEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
    mtFilter: TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  {
  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);

  mtFilter.conditionSQL := 'parentrefcode is null';
  mtFilter.orderBySQL := ' tk1.name'; // в ДАО в запросе пробит алиас tk1 !!!
  }

  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
          //*** if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
          //*** ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          if ENContractItemObj.material = nil then ENContractItemObj.material := TKMaterials.Create;
          ENContractItemObj.material.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          lblMeasurement.Caption := {'од.виміру : '+ }TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
          lblDeliveryDate.Caption := {'строк постачання : '+ } IntToStr(TKMaterialsShort(tvDep.Selected.Data).deliveryDate){ + ' днів'}; //GetReturnValue(sgSpr_matherial, 2);
          ///
          if TKMaterialsShort(tvDep.Selected.Data).cost <> nil then
            edtPrice.Text := TKMaterialsShort(tvDep.Selected.Data).cost.DecimalString;
          RecalcCost;
          edtCountGen.SetFocus;
          ///
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENContractItemEdit.spbMaterialClearClick(Sender: TObject);
begin
  edtMaterialName.Text := '';
  lblMeasurement.Caption := '';
  lblDeliveryDate.Caption := '';
  materialCode := LOW_INT;
end;

procedure TfrmENContractItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  contractCode := LOW_INT;
  spbMaterialClearClick(Sender);
end;

procedure TfrmENContractItemEdit.edtCountGenChange(Sender: TObject);
begin
  RecalcCost;
end;

procedure TfrmENContractItemEdit.RecalcCost;
var countGen, price, cost: Double;
begin
  countGen := 0;
  price := 0;
  cost := 0;

  try
    if edtCountGen.Text <> '' then
      countGen := StrToFloat(edtCountGen.Text);
  except
    on EConvertError do
      countGen := 0;
  end;

  try
    if edtPrice.Text <> '' then
      price := StrToFloat(edtPrice.Text);
  except
    on EConvertError do
      price := 0;
  end;

  cost := Conv(countGen * price, 2);

  if cost > 0 then
    edtCost.Text := FloatToStr(cost)
  else
    edtCost.Text := '';
end;

end.