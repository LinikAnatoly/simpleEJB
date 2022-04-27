
unit EditENFactEstimateItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemController,
  ExtCtrls, TB2Item, TB2Dock, TB2Toolbar ;

type
  TfrmENFactEstimateItemEdit = class(TDialogForm)


  HTTPRIOENEstimateItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    pcEstimateItms: TPageControl;
    tsMatherials: TTabSheet;
    lblCountGen: TLabel;
    lblCountFact: TLabel;
    lblCommentGen: TLabel;
    Label1: TLabel;
    lblEnPlan: TLabel;
    spbPlan: TSpeedButton;
    lblPlanItem: TLabel;
    spbPlanItem: TSpeedButton;
    spbMaterialName: TSpeedButton;
    lblMeasurement: TLabel;
    edtCountGen: TEdit;
    edtCountFact: TEdit;
    edtCommentGen: TEdit;
    edtMaterialName: TEdit;
    edtPlanItem: TEdit;
    edtPlan: TEdit;
    tsWorkers: TTabSheet;
    tsFINMaterials: TTabSheet;
    sgFINMaterials: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure spbPlanItemClick(Sender: TObject);
    procedure rgPlansClick(Sender: TObject);
    procedure pcEstimateItmsChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    ENPlanWorkCode: Integer;
    ENPlanWorkItemCode: Integer;
    ENPlanWorkItemName: String;
  end;

var
  frmENFactEstimateItemEdit: TfrmENFactEstimateItemEdit;
  ENEstimateItemObj: ENEstimateItem;

  FINMaterialsHeaders: array [1..14] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниці віиміру'
          ,'ФИО МОЛа'
          ,'название поставщика'
          ,'Дата поставки'
          ,'описание поставки'
          ,'...'
          ,'...'
          ,'Ціна розрахункова'
          ,'Кількість матеріалу'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
        );
          
implementation

uses

  TKMaterialsController, ShowTKMaterials
  , ENPlanWorkController,
  ENPlanWorkItemController, ShowENPlanWorkItem,
  ENEstimateItemTypeController, ENConsts, DMReportsUnit,
  FINMaterialsController, ShowFINMaterialsData, EditFINMaterialsData;


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemController  ;
}
{$R *.dfm}

procedure TfrmENFactEstimateItemEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
    Spr_matherialObj: TKMaterials;
    Spr_matherialFilterObj: TKMaterialsFilter;
    Spr_matherialList : TKMaterialsShortList;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkObj: ENPlanWork;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ENPlanWorkList: ENPlanWorkShortList;

    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    //ENPlanWorkItemObj: ENPlanWorkItem;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
    ENPlanWorkItemList: ENPlanWorkItemShortList;
begin
  tsWorkers.TabVisible := false;

  SetFloatStyle([edtCountGen, edtCountFact]);

  DisableControls([edtMaterialName, edtPlan, edtPlanItem]);

  HideControls([lblEnPlan, edtPlan, spbPlan, lblPlanItem, edtPlanItem, spbPlanItem]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

    DenyBlankValues([
      {edtCountGen}

      //,
      edtCountFact
      , edtMaterialName
     ]);
   end;

  if DialogState = dsView then
    DisableControls([edtPlan, edtPlanItem, spbPlan, spbPlanItem]);


  //if DialogState = dsInsert then
  //begin
{
    if ENPlanWorkCode > 0 then
    begin
      HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

      ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
      try
        SetNullIntProps(ENPlanWorkFilterObj);
        SetNullXSProps(ENPlanWorkFilterObj);

        ENPlanWorkFilterObj.code := ENPlanWorkCode;

        //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
        ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

        if ENPlanWorkList <> nil then
          if ENPlanWorkList.list <> nil then
            if High(ENPlanWorkList.list) >= 0 then
            begin
              edtPlan.Text := ENPlanWorkList.list[0].objectName;
              //rgPlans.ItemIndex := 0;
              //rgPlansClick(Sender);
            end;
      finally
        ENPlanWorkFilterObj.Free;
      end;
    end;
}

    if ENEstimateItemObj.planRef <> nil then
      if ENEstimateItemObj.planRef.code <> Low(Integer) then
      begin

        HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
        //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        try
          SetNullIntProps(ENPlanWorkFilterObj);
          SetNullXSProps(ENPlanWorkFilterObj);

          ENPlanWorkFilterObj.code := ENEstimateItemObj.planRef.code;

          //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
          ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

          if ENPlanWorkList <> nil then
            if ENPlanWorkList.list <> nil then
              if High(ENPlanWorkList.list) >= 0 then
                edtPlan.Text := ENPlanWorkList.list[0].objectName;
        finally
          ENPlanWorkFilterObj.Free;
        end;
      end;

    //if ENPlanWorkItemCode > 0 then
    begin
      //rgPlans.ItemIndex := 1;
      //rgPlansClick(Sender);


    if ENEstimateItemObj.planItemRef <> nil then
      if ENEstimateItemObj.planItemRef.code <> Low(Integer) then
      begin

       HideControls([  lblPlanItem , edtPlanItem, spbPlanItem ], false );
       edtPlanItem.Text := ENPlanWorkItemName;

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        //ENPlanWorkItemObj := TempENPlanWorkItem.getObject(ENEstimateItemObj.planItemRef.code);

        ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
        try
          SetNullIntProps(ENPlanWorkItemFilterObj);
          SetNullXSProps(ENPlanWorkItemFilterObj);

          ENPlanWorkItemFilterObj.code := ENEstimateItemObj.planItemRef.code;

          //ENPlanWorkItemList := TempENPlanWorkItem.getFilteredList(ENPlanWorkItemFilterObj);
          ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj, 0, -1);

          if ENPlanWorkItemList <> nil then
            if ENPlanWorkItemList.list <> nil then
              if High(ENPlanWorkItemList.list) >= 0 then
                edtPlanItem.Text := ENPlanWorkItemList.list[0].kartaRefName;
        finally
          ENPlanWorkItemFilterObj.Free;
        end;
      end;
    end;

  //end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([edtMaterialName, spbMaterialName, edtPlanItem, spbPlanItem]);

    if ENEstimateItemObj.materialRef <> nil then
      if ENEstimateItemObj.materialRef.code <> Low(Integer) then
      begin
        TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
        Spr_matherialFilterObj := TKMaterialsFilter.Create;
        SetNullIntProps(Spr_matherialFilterObj);
        Spr_matherialFilterObj.code := ENEstimateItemObj.materialRef.code;
        Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
        if  ( Spr_matherialList.totalCount > 0 ) then
        begin
           lblMeasurement.Caption := 'од.виміру : '+Spr_matherialList.list[0].measurementName;
           edtMaterialName.Text := Spr_matherialList.list[0].name;
        end
        else
        begin
           lblMeasurement.Caption := 'од.виміру : -- ';
           edtMaterialName.Text := '';
        end;

      end;

    if ( ENEstimateItemObj.countGen <> nil ) then
       edtCountGen.Text := ENEstimateItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    if ( ENEstimateItemObj.countFact <> nil ) then
       edtCountFact.Text := ENEstimateItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

    edtCommentGen.Text := ENEstimateItemObj.commentGen;


  end;

  DisableControls([edtCountGen, edtPlan, spbPlan]);

  tsMatherials.TabVisible := false;
end;



procedure TfrmENFactEstimateItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
eType : Integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMaterialName
      //,edtCountGen
      ,edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if (DialogState = dsEdit) then
      if not NoBlankValues([edtCountGen]) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action := caNone;
        Exit;
      end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

     if (ENEstimateItemObj.countGen = nil ) then
       ENEstimateItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENEstimateItemObj.countGen.decimalString := edtCountGen.Text 
     else
       //ENEstimateItemObj.countGen := nil;
       ENEstimateItemObj.countGen.DecimalString := '0'; // ??

     if (ENEstimateItemObj.countFact = nil ) then
       ENEstimateItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENEstimateItemObj.countFact.decimalString := edtCountFact.Text 
     else
       ENEstimateItemObj.countFact := nil;

     ENEstimateItemObj.commentGen := edtCommentGen.Text; 

            // определим тип элемента по коду
            // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты

      if ENPlanWorkCode > 0 then
      begin
        if ENEstimateItemObj.planRef = nil then
          ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
        ENEstimateItemObj.planRef.code := ENPlanWorkCode;
      end;

    eType := DMReports.getElementTypeByPlan(ENEstimateItemObj.planRef.code);

    if DialogState = dsInsert then
    begin
      ENEstimateItemObj.code:=low(Integer);



      if ENPlanWorkItemCode > 0 then
      begin
        if ENEstimateItemObj.planItemRef = nil then
          ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
        ENEstimateItemObj.planItemRef.code := ENPlanWorkItemCode;
      end;
      {
      if ENEstimateItemObj.typeRef = nil then
        ENEstimateItemObj.typeRef := ENEstimateItemTypeRef.Create;
      ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_MANUAL;
      }
         {
            case eType of
              1,2,3 : TempENEstimateItem.addBySRS(ENEstimateItemObj);
              5 : TempENEstimateItem.addBySVES(ENEstimateItemObj);
              6 : TempENEstimateItem.addBySPS(ENEstimateItemObj);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }
      TempENEstimateItem.add(ENEstimateItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
    {
      if ENEstimateItemObj.typeRef = nil then
        ENEstimateItemObj.typeRef := ENEstimateItemTypeRef.Create;
      ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_MANUAL; // ??
    }
            {case eType of
              1,2,3 : TempENEstimateItem.saveBySRS(ENEstimateItemObj);
              5 : TempENEstimateItem.saveBySVES(ENEstimateItemObj);
              6 : TempENEstimateItem.saveBySPS(ENEstimateItemObj);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;
            end;
            }
      TempENEstimateItem.save(ENEstimateItemObj);
    end;
  end;
end;


procedure TfrmENFactEstimateItemEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
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
      
      if ShowModal = mrOk then
      begin
        try
          if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
          ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENFactEstimateItemEdit.spbPlanItemClick(Sender: TObject);
var frmENPlanWorkItemShow: TfrmENPlanWorkItemShow;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
begin
  if DialogState = dsView then Exit;

  ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
  SetNullIntProps(ENPlanWorkItemFilterObj);
  SetNullXSProps(ENPlanWorkItemFilterObj);

  ENPlanWorkItemFilterObj.planRef := ENPlanWorkRef.Create;
  if DialogState = dsInsert then
  begin
    if ENPlanWorkCode > 0 then
      ENPlanWorkItemFilterObj.planRef.code := ENPlanWorkCode
    else
      Exit;
  end
  else
    ENPlanWorkItemFilterObj.planRef.code := ENEstimateItemObj.planRef.code;

  frmENPlanWorkItemShow := TfrmENPlanWorkItemShow.Create(Application, fmNormal, ENPlanWorkItemFilterObj);

  try
   // DisableActions([frmENPlanWorkItemShow.actNoFilter, frmENPlanWorkItemShow.actFilter]);
    
    with frmENPlanWorkItemShow do
      if ShowModal = mrOk then
      begin
        try
          if ENEstimateItemObj.planItemRef = nil then ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
          ENEstimateItemObj.planItemRef.code := StrToInt(GetReturnValue(sgENPlanWorkItem, 0));
          edtPlanItem.Text := GetReturnValue(sgENPlanWorkItem, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENPlanWorkItemShow.Free;
  end;
end;

procedure TfrmENFactEstimateItemEdit.rgPlansClick(Sender: TObject);
begin
{
  if rgPlans.ItemIndex = 0 then
  begin
    HideControls([edtPlan, spbPlan], false);
    HideControls([edtPlanItem, spbPlanItem]);
  end
  else
  begin
    HideControls([edtPlan, spbPlan]);
    HideControls([edtPlanItem, spbPlanItem], false);
  end;
 }

end;

procedure TfrmENFactEstimateItemEdit.pcEstimateItmsChange(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i: Integer;
  FINMaterialsList: FINMaterialsShortList;
  finMaterialFilter : FINMaterialsFilter;
begin
  inherited;
if pcEstimateItms.ActivePage = tsFINMaterials then
begin
  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  //if finMaterialFilter = nil then
  begin
     finMaterialFilter := FINMaterialsFilter.Create;
     SetNullIntProps(finMaterialFilter);
     SetNullXSProps(finMaterialFilter);
  end;

  finMaterialFilter.estimateItemRef := ENEstimateItemRef.Create;
  finMaterialFilter.estimateItemRef.code := ENEstimateItemObj.code;

  FINMaterialsList := TempFINMaterials.getScrollableFilteredList(finMaterialFilter,0,-1);


  //LastCount:=High(FINMaterialsList.list);

  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:= High(FINMaterialsList.list) + 2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list)  do
      begin
        Application.ProcessMessages;
        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;
        Cells[4,i+1] := FINMaterialsList.list[i].div_name;
        Cells[5,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        Cells[8,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        Cells[9,i+1] := FINMaterialsList.list[i].frc_name;
        if FINMaterialsList.list[i].calc_price = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[13,i+1] := ''
        else
          Cells[13,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        //LastRow:=i+1;
        sgFINMaterials.RowCount:=i+2;
      end;
   //ColCount:=ColCount+1;
   sgFINMaterials.Row:=1;
end;

end;

procedure TfrmENFactEstimateItemEdit.actInsertExecute(Sender: TObject);
var
   frmFINMaterialsDataEdit : TfrmFINMaterialsDataEdit;
begin
   frmFINMaterialsDataEdit:= TfrmFINMaterialsDataEdit.Create(Application,dsInsert);
   try
      frmFINMaterialsDataEdit.planCode := ENEstimateItemObj.planRef.code;
      
      with frmFINMaterialsDataEdit do
        if ShowModal = mrOk then
        begin
            try


            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataEdit.Free;
   end;

end;

{ форма материалов ...

procedure TfrmENEstimateItemEdit.actInsertExecute(Sender: TObject);
var
  frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  f : FINMaterialsFilter;
  m : FINMaterials ;
  TempFINMaterials: FINMaterialsControllerSoapPort;
begin



   frmFINMaterialsDataShow:= TfrmFINMaterialsDataShow.Create(Application,fmNormal);
   try
      //FINMaterialsO
      frmFINMaterialsDataShow.balansNumberCondition := '';
      frmFINMaterialsDataShow.molCode := '';
      frmFINMaterialsDataShow.materialCondition := '';
      frmFINMaterialsDataShow.finDocCode := low(Integer);
      frmFINMaterialsDataShow.dateDoc := TXSDate.Create;
      frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));


      with frmFINMaterialsDataShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkerObj.manningTable = nil then ENWorkerObj.manningTable := ENManningTable.Create();
               //ENWorkerObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               //edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);

               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := ENEstimateItemObj.code;

               m.mat_id :=  StrToInt(GetReturnValue(sgFINMaterials,0));
               m.nn := GetReturnValue(sgFINMaterials,3);

               TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
               TempFINMaterials.add(m);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataShow.Free;
   end;

end;
}

end.
