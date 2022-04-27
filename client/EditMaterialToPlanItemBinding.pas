unit EditMaterialToPlanItemBinding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, DialogFormUnit, Menus, ActnList,
  ImgList, TB2Item, TB2Dock, TB2Toolbar, InvokeRegistry, StdCtrls, Rio,
  SOAPHTTPClient;

type
  TfrmMaterialToPlanItemBindingEdit = class(TDialogForm)
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    pmActions: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lblMaterialName: TLabel;
    lblMaterialCount: TLabel;
    HTTPRIOENEstimateItem: THTTPRIO;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure UpdateAvailableCount;
  public
    { Public declarations }
    planCode: Integer;
    estimateItemCode: Integer;
    materialCode: Integer;
    materialName: String;
    materialCount: Double;
  end;

var
  frmMaterialToPlanItemBindingEdit: TfrmMaterialToPlanItemBindingEdit;

implementation

uses ENPlanWorkItemController, GridHeadersUnit, ENPlanWorkController,
  EditMaterialCount, ENEstimateItemController, TKMaterialsController, XSBuiltIns,
  DMReportsUnit, ENConsts, ENEstimateItemTypeController;

{$R *.dfm}

var
  ENPlanWorkItemHeaders: array [1..4] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'кількість матеріалу'
        );

procedure TfrmMaterialToPlanItemBindingEdit.FormCreate(Sender: TObject);
begin
  planCode := Low(Integer);
  materialCode := Low(Integer);
  materialName := '';
end;

procedure TfrmMaterialToPlanItemBindingEdit.FormShow(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i, LastCount: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  planItemFilter: ENPlanWorkItemFilter;
begin
  //lblMaterialName.Caption  := materialName;
  //lblMaterialCount.Caption := FloatToStr(materialCount);
  UpdateAvailableCount;

  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);

  //iColCount:=-1;

  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

  planItemFilter := ENPlanWorkItemFilter.Create;
  SetNullIntProps(planItemFilter);
  SetNullXSProps(planItemFilter);

  planItemFilter.planRef := ENPlanWorkRef.Create;
  planItemFilter.planRef.code := planCode;

  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter, 0, -1);

  LastCount := High(ENPlanWorkItemList.list);

  if LastCount > -1 then
    sgENPlanWorkItem.RowCount := LastCount + 2
  else
    sgENPlanWorkItem.RowCount := 2;

   with sgENPlanWorkItem do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENPlanWorkItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
        Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;

        //LastRow:=i+1;

        sgENPlanWorkItem.RowCount := i + 2; //LastRow+1;
      end;
//   iColCount:=iColCount+1;
   sgENPlanWorkItem.Row:=1;
end;

procedure TfrmMaterialToPlanItemBindingEdit.actEditExecute(
  Sender: TObject);
var currentCount: Double;
begin
  //if materialCount <= 0 then Exit;

  frmMaterialCountEdit := TfrmMaterialCountEdit.Create(Application, dsEdit);
  try
    frmMaterialCountEdit.materialName := materialName;
    frmMaterialCountEdit.availableCount := materialCount;

    frmMaterialCountEdit.planItemName := sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                         sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];

    try
      frmMaterialCountEdit.currentCount := 0;
      if sgENPlanWorkItem.Cells[3, sgENPlanWorkItem.Row] <> '' then
        frmMaterialCountEdit.currentCount := StrToFloat(sgENPlanWorkItem.Cells[3, sgENPlanWorkItem.Row]);
    except
      on EConvertError do Exit;
    end;

    //if frmMaterialCountEdit.enteredCount > materialCount then Exit;
    if (materialCount <= 0) and (frmMaterialCountEdit.currentCount = 0) then Exit;

    if frmMaterialCountEdit.ShowModal = mrOk then
    begin
      //if frmMaterialCountEdit.enteredCount > materialCount then Exit;
      
      sgENPlanWorkItem.Cells[3, sgENPlanWorkItem.Row] := FloatToStr(frmMaterialCountEdit.enteredCount);
      materialCount := materialCount - (frmMaterialCountEdit.enteredCount - frmMaterialCountEdit.currentCount);
      {***} if materialCount < 0.00000001 then materialCount := 0;
      UpdateAvailableCount;
    end;
  finally
    frmMaterialCountEdit.Free;
  end;
end;

procedure TfrmMaterialToPlanItemBindingEdit.UpdateAvailableCount;
begin
  lblMaterialName.Caption  := materialName;
  lblMaterialCount.Caption := FloatToStr(materialCount);
end;

procedure TfrmMaterialToPlanItemBindingEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i, planItemCode, eType: Integer;
  mCount, mCountBinded, mCountOrig: Double;
  materialSaved: Boolean;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  estimateItemFilter: ENEstimateItemFilter;
  ENEstimateItemObj, ENEstimateItemObjForBinding: ENEstimateItem;
begin
  if ModalResult = mrCancel then Exit;

  if Application.MessageBox(PChar('Зберегти прив''язку ?'),
                            PChar('Увага!'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK then
  begin
    ModalResult := mrNone;
    Exit;
  end;

  ///// Получаем код привязываемого материала
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObjForBinding := TempENEstimateItem.getObject(estimateItemCode);
  if ENEstimateItemObjForBinding = nil then Exit;
  if ENEstimateItemObjForBinding.materialRef = nil then Exit;
  materialCode := ENEstimateItemObjForBinding.materialRef.code;
  if ENEstimateItemObjForBinding.materialRef.code = Low(Integer) then Exit;
  /////

  eType := DMReports.getElementTypeByPlan(planCode);

  mCountBinded := 0;

  for i := 1 to sgENPlanWorkItem.RowCount - 1 do
  begin
    try
      mCount := StrToFloat(sgENPlanWorkItem.Cells[3, i]);
    except
      on EConvertError do Continue;
    end;

    if mCount = 0 then Continue;

    try
      planItemCode := StrToInt(sgENPlanWorkItem.Cells[0, i]);
    except
      on EConvertError do Continue;
    end;

    {
    ShowMessage('PlanItemCode: ' + sgENPlanWorkItem.Cells[0, i] + #13#10 +
                'MaterialCode: ' + IntToStr(materialCode) + #13#10 +
                'MaterialCount: ' + FloatToStr(mCount));
    }

    estimateItemFilter := ENEstimateItemFilter.Create;
    try
      SetNullIntProps(estimateItemFilter);
      SetNullXSProps(estimateItemFilter);

      estimateItemFilter.planItemRef := ENPlanWorkItemRef.Create;
      estimateItemFilter.planItemRef.code := planItemCode;
      estimateItemFilter.materialRef := TKMaterialsRef.Create;
      estimateItemFilter.materialRef.code := materialCode;


      /////////////////////////////////////////////////////////////////////////////////////
      // Ищем в списке материалов, уже привязанных к текущей работе, привязываемый нами материал.
      // Если он уже есть, то добавляем к его количеству заданное кол-во.
      // Если этот материал в работе отсутствует, добавляем этот материал с заданным кол-вом в работу.

      ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

      materialSaved := false;

      if ENEstimateItemList <> nil then
        if ENEstimateItemList.list <> nil then
          if High(ENEstimateItemList.list) >= 0 then
          begin
            ENEstimateItemObj := TempENEstimateItem.getObject(ENEstimateItemList.list[0].code);
            if ENEstimateItemObj = nil then Continue;
            try
              if ENEstimateItemObj.countFact = nil then ENEstimateItemObj.countFact := TXSDecimal.Create;
              ENEstimateItemObj.countFact.DecimalString := FloatToStr(StrToFloat(ENEstimateItemObj.countFact.DecimalString) + mCount);

              // Если материал был изначально добавлен в работу автоматически
              // с кол-вом из норматива, ставим ему тип "откорректированный нормативный",
              // иначе оставляем тип таким, какой он есть
              if ENEstimateItemObj.typeRef.code = ENESTIMATEITEMTYPE_AUTO then
                ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_CORRECTED;
              {
              //eType := DMReports.getElementTypeByPlan(planCode);
              case eType of
                1, 2, 3: TempENEstimateItem.saveBySRS(ENEstimateItemObj);
                5: TempENEstimateItem.saveBySVES(ENEstimateItemObj);
                6: TempENEstimateItem.saveBySPS(ENEstimateItemObj);
                else
                begin
                  Application.MessageBox(PChar('Невідомий тип Об''єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                  Exit;
                end;
              end;
              }
              TempENEstimateItem.save(ENEstimateItemObj);
              mCountBinded := mCountBinded + mCount;
              materialSaved := true;
            except
              on EConvertError do Continue;
            end;
          end;

      if not materialSaved then
      begin
        ENEstimateItemObj := ENEstimateItem.Create;
        ENEstimateItemObj.code := Low(Integer);

        ENEstimateItemObj.countGen := TXSDecimal.Create;
        ENEstimateItemObj.countFact := TXSDecimal.Create;
        //ENEstimateItemObj.dateEdit := TXSDate.Create;

        ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
        ENEstimateItemObj.planRef.code := planCode;
        ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
        ENEstimateItemObj.planItemRef.code := planItemCode;

        ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
        ENEstimateItemObj.materialRef.code := materialCode;

        ENEstimateItemObj.countGen.DecimalString := '0';
        ENEstimateItemObj.countFact.DecimalString := FloatToStr(mCount);

        ENEstimateItemObj.commentGen := 'матеріал, доданий в роботу при ручній прив''язці';

        // ставим материалу тип "ручной на строку плана"
        ENEstimateItemObj.typeRef := ENEstimateItemTypeRef.Create;
        ENEstimateItemObj.typeRef.code := ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM;
        {
        case eType of
          1, 2, 3: TempENEstimateItem.addBySRS(ENEstimateItemObj);
          5: TempENEstimateItem.addBySVES(ENEstimateItemObj);
          6: TempENEstimateItem.addBySPS(ENEstimateItemObj);
          else
          begin
            Application.MessageBox(PChar('Невідомий тип Об''єкту !!!'), PChar('Помилка'), MB_ICONERROR);
            Exit;
          end;
        end;
        }

        TempENEstimateItem.add(ENEstimateItemObj);

        mCountBinded := mCountBinded + mCount;
      end;
      /////////////////////////////////////////////////////////////////////////////////////
    finally
      estimateItemFilter.Free;
    end;
  end;

  // После привязки материала к работам необходимо рассчитать оставшееся непривязанным
  // кол-во и обновить значение кол-ва в строке с привязываемым материалом.
  // Если материал полностью разнесен по работам (т.е. оставшееся кол-во = 0),
  // то строку с этим материалом (которая была привязана на сам план) удаляем
  try
    mCountOrig := StrToFloat(ENEstimateItemObjForBinding.countFact.DecimalString);

    // привязывют материалы БЕЗ кол-ва !!!!!!!!!!!
    if mCountBinded = 0 then
    begin
      Application.MessageBox(PChar('Не введено кількість матеріалу на цю Роботу ... !'),
                            PChar('Увага!'),
                            MB_ICONERROR);
    ModalResult := mrNone;
    Exit;

    end;


    if (mCountOrig - mCountBinded) > 0.00000001  then // типа привязали не весь материал
    begin
      ENEstimateItemObjForBinding.countFact.DecimalString := FloatToStr(mCountOrig - mCountBinded);
      {
      case eType of
        1, 2, 3: TempENEstimateItem.saveBySRS(ENEstimateItemObjForBinding);
        5: TempENEstimateItem.saveBySVES(ENEstimateItemObjForBinding);
        6: TempENEstimateItem.saveBySPS(ENEstimateItemObjForBinding);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об''єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          Exit;
        end;
      end;
      }
      TempENEstimateItem.save(ENEstimateItemObjForBinding);
    end
    else
    {
      case eType of
        1, 2, 3: TempENEstimateItem.removeBySRS(estimateItemCode);
        5: TempENEstimateItem.removeBySVES(estimateItemCode);
        6: TempENEstimateItem.removeBySPS(estimateItemCode);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об''єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          Exit;
        end;
      end;
      }
      TempENEstimateItem.remove(estimateItemCode);
  except
    on EConvertError do Exit;
  end;

  Application.MessageBox(PChar('Прив''язка збережена!'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmMaterialToPlanItemBindingEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте закрити форму? Усі введені дані про прив''язку НЕ БУДУТЬ ЗБЕРЕЖЕНІ!!!'),
                            PChar('Увага!'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    CanClose := false
  else
    CanClose := true;
end;

end.
